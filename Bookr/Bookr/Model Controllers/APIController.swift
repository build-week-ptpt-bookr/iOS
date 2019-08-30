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

enum NetworkError: Error {
    case noAuth
    case badAuth
    case otherError
    case badData
    case noDecode
}

class APIController {
    
    // MARK: - Sign UP
    
    private let baseUrl =  URL(string: "https://lambda-bookr.herokuapp.com/api")!
    var user: User?

    
    //create fucntion for sign up
    func signUp(with user: User, completion: @escaping (Error?) -> ()) {
        let signUpUrl = baseUrl.appendingPathComponent("auth/register")
        var request = URLRequest(url: signUpUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData
            print(String(data:jsonData, encoding: .utf8)!)
        } catch {
            print("Error encoding user object: \(error)")
            completion(error)
            return
        }
        URLSession.shared.dataTask(with: signUpUrl) { (data, response, error) in
            guard let data = data, let response = response as? HTTPURLResponse else {
                return
            }
            
            switch response.statusCode {
            case 400...599:
                print(String(data: data, encoding: .utf8) ?? "No UTF-8 response data")
            case 200: print("Success")
            default:
                print(String(response.statusCode))
            }
        
            completion(nil)
        }.resume()
    }
    // MARK: - Sign IN
    // create function for sign in
    func signIn(with user: User, completion: @escaping (Error?) -> ()) {
        let signInUrl = baseUrl.appendingPathComponent("auth/login")
        var request = URLRequest(url: signInUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(self.user)
            request.httpBody = jsonData
            print(String(data: jsonData, encoding: .utf8)!)
            jsonEncoder.outputFormatting = .prettyPrinted
        } catch {
            print("Error encoding user object: \(error)")
            completion(error)
            return
        }
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                print(response.statusCode)
                return
            }
            if let error = error {
                completion(error)
                return
            }
            
            guard let data = data else {
                completion(NSError())
                return
            }
            print(data)
            let decoder = JSONDecoder()
            do {
                var newUser: User
                newUser = try decoder.decode(User.self, from: data)
                self.user = newUser
                
            } catch {
                print("Error encoding user object: \(error)")
                completion(error)
                return
            }
            
            completion(nil)
            }.resume()
    }
}
