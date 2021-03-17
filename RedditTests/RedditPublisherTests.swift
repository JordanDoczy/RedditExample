//
//  RedditPublisherTests.swift
//  RedditTests
//
//  Created by Jordan Doczy on 3/16/21.
//

import XCTest
@testable import Reddit

class RedditPublisherTests: XCTestCase {
    
    var publisher: RedditPublisher!
    
    override func setUp() {
        super.setUp()
        publisher = RedditPublisher(threshold: RedditConstants.AutoRefreshThreshold)
    }
    
    override func tearDown() {
        publisher = nil
        super.tearDown()
    }

    func testIsLoadingTrue() {
        XCTAssertFalse(publisher.cancellable != nil)
        publisher.getPosts() 
        XCTAssertTrue(publisher.cancellable != nil)
    }
    
    func testShouldGetMoreResultsTrue() {
        
        let threshold = RedditConstants.AutoRefreshThreshold
        let posts = MockData.RedditPosts
        let activeIndex = posts.index(posts.endIndex, offsetBy: -threshold)
        let activePost = posts[activeIndex]
        
        publisher.posts = MockData.RedditPosts
        
        XCTAssertFalse(publisher.cancellable != nil)
        let result = publisher.getMorePostsIfNeeded(currentItem: activePost) // should be true
        XCTAssertTrue(publisher.cancellable != nil)
        XCTAssertTrue(result)
    }
    
    func testShouldGetMoreResultsFalse() {
        
        let threshold = RedditConstants.AutoRefreshThreshold - 1
        let posts = MockData.RedditPosts
        let activeIndex = posts.index(posts.endIndex, offsetBy: -threshold)
        let activePost = posts[activeIndex]
        
        publisher.posts = MockData.RedditPosts
        
        XCTAssertFalse(publisher.cancellable != nil)
        let result = publisher.getMorePostsIfNeeded(currentItem: activePost) // should be false
        XCTAssertFalse(publisher.cancellable != nil)
        XCTAssertFalse(result)

    }
    
}
