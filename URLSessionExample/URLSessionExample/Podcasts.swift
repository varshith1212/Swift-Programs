//
//  podcasts.swift
//  URLSessionExample
//
//  Created by Sai Varshith on 24/03/23.
//  Copyright © 2023 Sai Varshith. All rights reserved.
//

import Foundation

struct Podcasts: Codable {
    var feed: Feed
}

struct Feed: Codable {
    var results: [Results]
}

struct Results: Codable {
    var artistName : String
    var name: String
    var artworkUrl100:String
    var genres:[Genres]
}

struct Genres:Codable {
    var name:String
}
