//
//  RedditConstants.swift
//  Reddit
//
//  Created by Jordan Doczy on 3/17/21.
//

import Foundation

struct RedditConstants {
    static let RedditAPI = "https://www.reddit.com/.json?after="
    static let AutoRefreshThreshold = 5 // index from bottom of list, ex: list length = 25, returns true when index is 20
}
