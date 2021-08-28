//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by mac on 28/08/21.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error) // Many things can go wrong. So iOS Standard use Error protocol.
}

protocol FeedLoader {
    func load(complition : @escaping (LoadFeedResult) -> Void)
}
