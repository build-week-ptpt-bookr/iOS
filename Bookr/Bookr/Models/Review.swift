//
//  ReviewModel.swift
//  Bookr
//
//  Created by John Kouris on 8/22/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import Foundation

struct Review: Codable {
    var id: Int
    var reviewID: Int
    var title: String
    var username: String
    var bookId: Int
    var userId: Int
    var rating: Double?
    var comment: String?
    
//    init(id: Int, reviewId: Int, title: String, username: String, bookID: Int, userID: Int, rating: Double, comment: String) {
//        self.id = id
//        self.reviewID = reviewId
//        self.title = title
//        self.username = username
//        self.bookId = bookID
//        self.userId = userID
//        self.rating = rating
//        self.comment = comment
//    }
}
