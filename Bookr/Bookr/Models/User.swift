//
//  User.swift
//  Bookr
//
//  Created by John Kouris on 8/26/19.
//  Copyright © 2019 Bookr Team. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Int
    var userId: Int?
    var username: String
    var password: String?
    var roles: [String]?
    var token: String?
    
//    init(id: Int, username: String, password: String, roles: [String]?, token: String?) {
//        self.id = id
//        self.userId = id
//        self.username = username
//        self.password = password
//        self.roles = roles
//    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case userId = "userId"
        case username = "username"
        case password = "password"
        case roles = "roles"
        case token = "token"

    }
}


