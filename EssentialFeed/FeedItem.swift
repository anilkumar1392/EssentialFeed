//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by mac on 28/08/21.
//

import Foundation

struct FeedItem {
    var id: UUID
    var description: String?
    var location: String?
    var imageUrl: URL
}


/*
    WE want seperate module to create this feeditem it may be created from.
    1. Remote representation
    2. Local cache representation
 */
