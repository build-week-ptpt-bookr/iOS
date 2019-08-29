//
//  NetworkController.swift
//  Bookr
//
//  Created by Aaron on 8/28/19.
//  Copyright © 2019 Bookr Team. All rights reserved.
//

import Foundation

class NetworkController {
  
    var user: User?
    let login = LoginViewController()
    
    func sendPost() {
    
        guard let url = URL(string: "https://lambda-bookr.herokuapp.com/api/auth/register") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let newPost = user
        do {
            let jsonBody = try JSONEncoder().encode(newPost)
            request.httpBody = jsonBody
        } catch {
            print("Unexpected error: \(error)")
            login.alertMessage(title: "Error", message: "It looks like there was an error proccessing. Try again later.")
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, _, _) in
            guard let data = data else { return }
            do {
                let sentPost = try JSONDecoder().decode(User.self, from: data)
                print(sentPost)
            } catch {}
        }
        task.resume()
        
    }
    
    func Get(completed: @escaping () -> ()) {
        
        guard let url = URL(string: "https://lambda-bookr.herokuapp.com/api/auth/login") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error == nil {
                do {
                    self.user = try JSONDecoder().decode(User.self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("JSON Error")
                }
            }
            }.resume()
    }
    
    
    
    
    
    
    
}
