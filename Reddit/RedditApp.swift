//
//  RedditApp.swift
//  Reddit
//
//  Created by Jordan Doczy on 3/16/21.
//

import SwiftUI

@main
struct RedditApp: App {
    
    var publisher = RedditPublisher(threshold: RedditConstants.AutoRefreshThreshold)
    
    var body: some Scene {
        WindowGroup {
            RedditFeed(publisher: publisher)
                .onAppear {
                    publisher.getPosts()
                }
        }
    }
}
