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
    
    private let baseUrl =  URL(string: "https://lambda-bookr.herokuapp.com/api/")!
    var user: User?
    var loginUser: Login?
    var registerUser: Login?
    
    //create fucntion for sign up
    func signUp(with username: String, password: String, completion: @escaping (Error?) -> ()) {
        let signUpUrl = baseUrl.appendingPathComponent("auth/register")
        var request = URLRequest(url: signUpUrl)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        registerUser = Login(username: username, password: password)
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(registerUser)
            request.httpBody = jsonData
            print(jsonData.prettyPrintedJSONString!)
        } catch {
            print("Error encoding user object: \(error)")
            completion(error)
            return
        }
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 201 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }
            if let error = error {
                completion(error)
                return
            }
            
            completion(nil)
        }.resume()
    }
    // MARK: - Sign IN
    // create function for sign in
    func LogIn(with username: String, password: String, completion: @escaping (Error?) -> ()) {
        loginUser = Login(username: username, password: password)
        let signInUrl = baseUrl.appendingPathComponent("auth/login")
        var request = URLRequest(url: signInUrl)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(loginUser)
            request.httpBody = jsonData
           
        } catch {
            print("Error encoding user object: \(error)")
            completion(error)
            return
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
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
            

            let jsonCheck = data.prettyPrintedJSONString!
            print(jsonCheck)
            
            do {
                let decoder = JSONDecoder()
                self.user = try decoder.decode(User.self, from: data)
                print(self.user?.token)
                print(self.user?.id)
            } catch {
                print("Error encoding user object: \(error)")
                completion(error)
                return
            }
            
            completion(nil)
            }.resume()
    }
    
    

}
