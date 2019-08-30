//
//  BookController.swift
//  Bookr
//
//  Created by John Kouris on 8/26/19.
//  Copyright © 2019 Bookr Team. All rights reserved.
//

import UIKit

class BookController {
    
    private(set) var books: [Book] = []
    private let baseUrl =  URL(string: "https://lambda-bookr.herokuapp.com/api")!
    
    func loadBooks(with books: String) {
        
        let bookUrl = baseUrl.appendingPathComponent("books/:id")
        var request = URLRequest(url: bookUrl)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(books)
            request.httpBody = jsonData
            
        } catch {
            
                        return
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
               
                return
            }
            if let error = error {
                
                return
            }
            
            guard let data = data else {
         
                return
            }
            
            let decoder = JSONDecoder()
            do {
                self.books = [try decoder.decode(Book.self, from: data)]
                
            } catch {
                
                
                return
            }
            
       
            }.resume()
    
    
        
    }
    
    func delete(book: Book) {
        
        // TODO - Add code to delete a book from API
        
    }
    
}


