//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by mac on 28/08/21.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL : URL?
}


class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL(){
        //Arrange
        _ = RemoteFeedLoader()
        let clinet = HTTPClient()
        
        //Assert
        XCTAssertNil(clinet.requestedURL)
    }

}
