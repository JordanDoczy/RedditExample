//
//  APIGateway.swift
//  Reddit
//
//  Created by Jordan Doczy on 3/16/21.
//

import Foundation
import Combine
import SwiftUI


protocol NewsPublisher: ObservableObject where Item: Post {
    associatedtype Item
    var posts: [Item] { get set }
    var cursor: String { get set }
    func getPosts(after: String) -> Void
    func getMorePostsIfNeeded(currentItem item: Item?) -> Bool
}

final class RedditPublisher: NewsPublisher {
    @Published var posts: [RedditPost] = []
    @Published var cursor: String = ""
    
    private (set) var cancellable: AnyCancellable?
    private (set) var isLoading = false
    
    var threshold = 0
    
    init(threshold: Int = 0) {
        self.threshold = threshold
    }
    
    func getPosts(after: String="") {
        guard !isLoading else {
            return
        }

        let url = URL(string: "\(RedditConstants.RedditAPI)\(after)")!

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { try? JSONDecoder().decode(RedditResult.self, from: $0.data) }
            .replaceError(with: nil)
            .handleEvents(receiveSubscription: { [weak self] _ in self?.onStart() },
                          receiveCompletion: { [weak self] _ in self?.onFinish() },
                          receiveCancel: { [weak self] in self?.onFinish() })
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let strongSelf = self else { return }
                if let result = $0 {
                    strongSelf.posts += result.data.children.map { $0.data } // traverse result to the array of posts
                    strongSelf.cursor = result.data.after // grab cursor for future requests
                }
            }
    }
    
    func getMorePostsIfNeeded(currentItem item: RedditPost?) -> Bool {
        guard let item = item else { // no item, then fetch some items
            getPosts()
            return true
        }
        
        let thresholdIndex = posts.index(posts.endIndex, offsetBy: -threshold) // determine threshold to start the next fetch
        if posts.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
            getPosts(after: cursor)
            return true
        }
        
        return false
    }
    
    func cancel() {
        cancellable?.cancel()
    }

    private func onStart() {
        isLoading = true
    }
    
    private func onFinish() {
        isLoading = false
    }
}
