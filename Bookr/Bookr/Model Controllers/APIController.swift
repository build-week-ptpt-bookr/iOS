//
//  APIController.swift
//  Bookr
//
//  Created by Aaron on 8/27/19.
//  Copyright © 2019 Bookr Team. All rights reserved.
//

import Foundation
import UIKit

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class APIController {
    
    // TODO: - Create network call that adds user into back in and log them in
    
    private let baseUrl =  URL(string: "https://lambda-bookr.herokuapp.com/api")!
    var bearer: Bearer?
    
    //create fucntion for sign up
    func signUp(with user: User, completion: @escaping (Error?) -> ()) {
        let signUpUrl = baseUrl.appendingPathComponent("auth/register")
        var request = URLRequest(url: signUpUrl)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    // create function for sign in
    
    // create function for fetching all users
}
