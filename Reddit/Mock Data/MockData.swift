//
//  MockData.swift
//  Reddit
//
//  Created by Jordan Doczy on 3/18/21.
//

#if DEBUG
import Foundation

struct MockData {
    
    static var ThumbnailImage = "https://a.thumbs.redditmedia.com/BSgc0SbG5yNVUb0Hqqs_EJus_KTDcVuFD-LjhsEftM8.jpg"
    
    static var RedditPosts: [RedditPost] = [
        .init(id: "1", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/one",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title One", ups: 100, url: ""),
        .init(id: "2", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/two",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Two", ups: 100, url: ""),
        .init(id: "3", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/three",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Three", ups: 100, url: ""),
        .init(id: "4", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/four",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Four", ups: 100, url: ""),
        .init(id: "5", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/five",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Five", ups: 100, url: ""),
        .init(id: "6", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/six",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Six", ups: 100, url: ""),
        .init(id: "7", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/seven",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Seven", ups: 100, url: ""),
        .init(id: "8", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/eight",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Eight", ups: 100, url: ""),
        .init(id: "9", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/nine",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Nine", ups: 100, url: ""),
        .init(id: "10", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/ten",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Ten", ups: 100, url: ""),
        .init(id: "11", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/eleven",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Eelven", ups: 100, url: ""),
        .init(id: "12", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/twelve",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Twelve", ups: 100, url: ""),
        .init(id: "13", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/thirteen",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Thirteen", ups: 100, url: ""),
        .init(id: "14", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/fourteen",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Fourteen", ups: 100, url: ""),
        .init(id: "15", created_utc: 0, downs: 0, num_comments: 10, subreddit_name_prefixed: "r/fifteen",
              thumbnail: ThumbnailImage,
              thumbnail_width: 100, thumbnail_height: 100, title: "Title Fifteen", ups: 100, url: "")
    ]
    
}

#endif
