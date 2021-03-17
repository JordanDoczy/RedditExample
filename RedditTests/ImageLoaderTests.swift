//
//  ImageLoaderTests.swift
//  RedditTests
//
//  Created by Jordan Doczy on 3/18/21.
//

import XCTest
@testable import Reddit

class ImageLoaderTests: XCTestCase {

    var imageLoader: ImageLoader!
    var url: URL!
    var cache: TemporaryImageCache!
    
    override func setUp() {
        super.setUp()
        url = URL(string: MockData.ThumbnailImage)!
        cache = TemporaryImageCache()
        imageLoader = ImageLoader(url: url, cache: cache)
    }
    
    override func tearDown() {
        imageLoader = nil
        super.tearDown()
    }

    func testIsLoadingTrue() {
        XCTAssertFalse(imageLoader.cancellable != nil)
        imageLoader.load()
        XCTAssertTrue(imageLoader.cancellable != nil)
    }
    
    func testWillPullFromCacheTrue() {
        cache[url] = UIImage()
        XCTAssertFalse(imageLoader.image != nil)
        imageLoader.load()
        XCTAssertTrue(imageLoader.image != nil)
    }

    func testWillPullFromCacheFalse() {
        XCTAssertFalse(imageLoader.image != nil)
        imageLoader.load()
        XCTAssertFalse(imageLoader.image != nil)
    }

}
