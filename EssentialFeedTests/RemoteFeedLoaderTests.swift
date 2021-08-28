//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by mac on 28/08/21.
//

import XCTest

class RemoteFeedLoader {
    
    let client: HTTPClient
    let url: URL
    init(url: URL = URL(string: "https://a-url.com")!, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    func load() {
        //HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
        
        //HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
        
        //client.get(from: URL(string: "https://a-url.com")!)
        
        client.get(from: url)
    }
}

/*
class HTTPClient {
    // static var shared = HTTPClient()
    
    // private init(){}   // Remove as this is not a singelton anymore.
    
    func get(from url: URL) { }
} */

protocol HTTPClient {
    func get(from url: URL)
}

//Test Specific
class HTTPClientSpy : HTTPClient {
    var requestedURL : URL?
    
    /*
    override func get(from url: URL) {
        requestedURL = url
    }*/
    
    func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL(){
        //Arrange
        //let clinet = HTTPClient()
        
        //let client = HTTPClient.shared
        
        //let client = HTTPClientSpy()
        //HTTPClient.shared = client
        
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
        
        //Assert
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL(){
        //let client = HTTPClient()
        
        //let client = HTTPClient.shared
        
        //let client = HTTPClientSpy()
        //HTTPClient.shared = client
        
        let url = URL(string: "https://a-url.com")!
        let client = HTTPClientSpy()
        
        let sut = RemoteFeedLoader(url: url, client: client)
        sut.load()
        //XCTAssertNotNil(client.requestedURL)
        
        XCTAssertEqual(client.requestedURL, url)
    }

}


/*
    1. Implemented Singleton way of doing things by moveing away form dependency injection and adapting to concrete types.
 
    2. HTTP Client do not have any reason to be singelton we can have multiple HTTPClients
 */


/*
  //  Get rid of Singelton.
     Move the test logic to subclass of HTTPClient
 */


/*
  Using Singelton we can write testable code but we can even write better.
  We can use composition rather than Inheritacne.
  Usign this we dont need shared instacne any more.
  
  //Less code btter control, we need to care about less responsibility.
  We do not need to inject a shared instance any more.
  Our Client do not need to locate that instance any more.
  They can just use whatever is given.
 */
