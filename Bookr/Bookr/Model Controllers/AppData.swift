//
//  AppData.swift
//  Bookr
//
//  Created by Joshua Kaunert on 8/29/19.
//  Copyright © 2019 Bookr Team. All rights reserved.
//

import Foundation

class AppData {
    static let shared = AppData()
    private init(){}
    
    var usersArray: [User]?
    var books: [Book]?
    
    
}
