//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by mac on 28/08/21.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        //HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
        
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    //private init(){}   // Reovme as this is not a singelton anymore.
    func get(from url: URL) { }
}

//Test Specific
class HTTPClientSpy : HTTPClient {
    var requestedURL : URL?
    override func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL(){
        //Arrange
        //let clinet = HTTPClient()
        
        //let client = HTTPClient.shared
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        
        _ = RemoteFeedLoader()
        
        //Assert
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL(){
        //let client = HTTPClient()
        //let client = HTTPClient.shared
        
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        
        let sut = RemoteFeedLoader()
        sut.load()
        XCTAssertNotNil(client.requestedURL)
    }

}


/*
    1. Implemented Singleton way of doing things by moveing away form dependency injection and adapting to concrete types.
 
    2. HTTP Client do not have any reason to be singelton we can have multiple HTTPClients
 */


/*
  // Get rid of Singelton.
     Move the test logic to subclass of HTTPClient
 */
