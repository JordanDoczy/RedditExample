//
//  RedditPost.swift
//  Reddit
//
//  Created by Jordan Doczy on 3/16/21.
//

import Foundation
import UIKit

protocol Post: Identifiable {
    var id: String { get }
    var title: String  { get }
    var url: String  { get }
    var createdDate: String { get }
    var group: String { get }
    var numberOfComments: String { get }
    var numberOfUpVotes: String { get }
    var numberOfDownVotes: String { get }
    var thumbnailURL: URL? { get }
    var thumbnailSize: CGSize { get }
}

struct RedditPost: Decodable, Post {
    var id: String
    var created_utc: Int
    var downs: Int
    var num_comments: Int
    var subreddit_name_prefixed: String
    var thumbnail: String
    var thumbnail_width: Int?
    var thumbnail_height: Int?
    var title: String
    var ups: Int
    var url: String
    
    var createdDate: String {
        
        func formateDate(_ date: Date) -> String{
            let formatter = RelativeDateTimeFormatter()
            formatter.unitsStyle = .full
            return formatter.localizedString(for: date, relativeTo: Date())
        }
        
        return formateDate(Date(timeIntervalSince1970: Double(created_utc)))
    }
    
    var group: String {
        return subreddit_name_prefixed
    }
    
    var numberOfComments: String {
        num_comments > 0 ? String.numberToString(from: num_comments) : ""
    }
    
    var numberOfUpVotes: String {
        ups > 0 ? String.numberToString(from: ups) : ""
    }
    
    var numberOfDownVotes: String {
        downs > 0 ? String.numberToString(from: downs) : ""
    }
    
    var thumbnailURL: URL? {
        thumbnail.contains("http") ? URL(string: thumbnail) : nil
    }
    
    var thumbnailSize: CGSize {
        CGSize(width: thumbnail_width ?? 0, height: thumbnail_height ?? 0)
    }
}

struct RedditResult: Decodable {

    var data: RedditData

    struct RedditData: Decodable {
        var children: [RedditChild]
        var after: String
    }

    struct RedditChild: Decodable {
        var data: RedditPost
    }
}
