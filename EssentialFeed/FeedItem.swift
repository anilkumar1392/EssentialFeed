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
    WE want seperate module to create this feedItem it may be created from.
    1. Remote representation
    2. Local cache representation
 
    WE have feedItem now add Interface or boundary that implement the feedItem That will seperate the modules.
 */
