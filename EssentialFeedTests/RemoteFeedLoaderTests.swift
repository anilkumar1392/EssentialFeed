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
    init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    func load() {
        //HTTPClient.shared.requestedUrl = URL(string : "https://a-url.com")
        
        //HTTPClient.shared.get(from: URL(string : "https://a-url.com")!)
        
        client.get(from: url)
    }
}


/*
class HTTPClient {
    static var shared = HTTPClient()
    //private init() {}
    func get(from url : URL){}
}*/

//Instead of using class as abstract protocol is bteer approach
protocol HTTPClient {
    func get(from url : URL)
}

/*
   HTTPClient is going to be used in our production code and we don;t want and testign code to be present in production.
   So We need to creata a HTTPClientSpy Class for testign only.
 */


/*
   Our code is still testable while using Inheritance.
 
   Using shared instance directly is not gud.
   Beacuse we are mixing responsibilites.
 
   Responsibility of Invoking a method and locating this objects.
 
   we can do better.
 */

class RemoteFeedLoaderTests: XCTestCase {


    func test_init_doesNotRequestDataFromURL(){
        //let client = HTTPClient()
        
        //let client = HTTPClient.shared
        
        /*
        // Create a spy and overide shared property
        let client = HTTPClientSpy()
        HTTPClient.shared = client*/
        
        let url = URL(string : "https://a-url.com")!
        //let client = HTTPClientSpy()
        //_ = RemoteFeedLoader(url: url, client : client)
        let (_, client) = makeSUT(url: url)

        XCTAssertNil(client.requestedUrl)
    }
    
    
    func test_load_requestDataFromURL(){
        //let client = HTTPClient()
        
        /*
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader() */
        
        /*
        // Create a spy and overide shared property
        let client = HTTPClientSpy()
        HTTPClient.shared = client*/
        
        let url = URL(string : "https://a-url.com")!
        //let client = HTTPClientSpy()
        //let sut = RemoteFeedLoader(url: url,client : client)
        let (sut, client) = makeSUT(url: url)
        
        //Act
        sut.load()
        
        //Assert
        //XCTAssertNotNil(client.requestedUrl)
        XCTAssertEqual(client.requestedUrl,url)
        
    }
    
    private func makeSUT(url: URL = URL(string : "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url,client : client)
        return (sut,client)
    }
    
    //Test specific client
    private class HTTPClientSpy : HTTPClient {
        var requestedUrl : URL?
        /*
        override func get(from url : URL){
            requestedUrl = url
        }*/
        
        func get(from url : URL){
            requestedUrl = url
        }
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

/*
  Their is no reason for HTTPClient to be singelton or a shared instacne, apart from convenience to locate the instacne directly.
 */


