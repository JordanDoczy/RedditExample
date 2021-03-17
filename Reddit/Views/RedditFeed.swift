//
//  RedditFeed.swift
//  Reddit
//
//  Created by Jordan Doczy on 3/16/21.
//

import SwiftUI

struct RedditFeed<Model>: View where Model: NewsPublisher {
    
    @ObservedObject var publisher: Model
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ZStack {
            List (publisher.posts) { post in
                VStack (alignment: .leading) {
                    HStack {
                        Text(post.group)
                        Image(systemName: "circle.fill")
                            .font(.system(size: 5))
                        Text(post.createdDate)
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 4)
                    
                    Button {
                        openURL(URL(string: post.url)!)
                    } label: {
                        Text(post.title)
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                        
                        if let url = post.thumbnailURL {
                            AsyncImageView(
                                url: url,
                                placeholder: { Text("Loading ...") },
                                image: { Image(uiImage: $0).resizable() }
                            )
                            .frame(width: post.thumbnailSize.width, height: post.thumbnailSize.height)
                            .padding(0)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "arrow.up.square.fill")
                        Text(post.numberOfUpVotes)
                        Image(systemName: "arrow.down.square.fill")
                        Text(post.numberOfDownVotes)
                        Spacer()
                        Image(systemName: "bubble.left.fill")
                        Text(post.numberOfComments)
                    }
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.gray)
                    .padding(0)
                    
                }
                .onAppear {
                    _ = publisher.getMorePostsIfNeeded(currentItem: post)
                }
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
            .padding()
            if publisher.posts.isEmpty {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }

        }
    }
}

struct RedditFeed_Previews: PreviewProvider {
    
    class TestPublisher: NewsPublisher {
        
        @Published var posts: [RedditPost] = MockData.RedditPosts
        @Published var cursor: String = ""
        
        func getPosts(after: String) { }
        func getMorePostsIfNeeded(currentItem item: RedditPost?) -> Bool { return false }
    }
    
    static var previews: some View {
        RedditFeed(publisher: TestPublisher())
    }
}
