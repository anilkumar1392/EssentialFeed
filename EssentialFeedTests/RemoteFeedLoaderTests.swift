//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by mac on 28/08/21.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    private init(){}
    var requestedURL : URL?
}


class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL(){
        //Arrange
        //let clinet = HTTPClient()
        
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
        
        //Assert
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL(){
        //let client = HTTPClient()
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        sut.load()
        XCTAssertNotNil(client.requestedURL)
    }

}


/*
    1. Implemented Singleton way of doing things by moveing away form dependency injection and adapting to concrete types.
 
    2. HTTP Client do not have any reason to be singelton we can have multiple HTTPClients
 */
