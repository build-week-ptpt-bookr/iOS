//
//  Books.swift
//  Bookr
//
//  Created by Aaron on 8/22/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import Foundation

struct Book: Codable {
    var id: Int
    var bookID: Int
    var title: String
    var coverUrl: String
    var description: String?
    var average: Double?
    var authors: [String]
    var reviews: [Review]?
    
    init(id: Int, title: String, coverUrl: String, description: String?, average: Double?, authors: [String], reviews: [Review]){
        self.id = id
        self.bookID = id
        self.title = title
        self.coverUrl = coverUrl
        self.description = description
        self.average = average
        self.authors = authors
        self.reviews = reviews
    }
    
}




