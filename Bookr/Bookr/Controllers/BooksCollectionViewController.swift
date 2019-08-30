//
//  BooksCollectionViewController.swift
//  Bookr
//
//  Created by John Kouris on 8/25/19.
//  Copyright © 2019 Bookr Team. All rights reserved.
//

import UIKit

class BooksCollectionViewController: UICollectionViewController {
    
    let bookController = BookController()
    let apiController = APIController()
    
    
    var delegate: LoginDelegate?
    var booksToken = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
       bookController.loadBooks(with: booksToken)
        
    }



    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMain" {
            if let loginVC = segue.destination as? LoginViewController {
                loginVC.apiController = apiController
            }
        }
    }

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return bookController.books.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
        
        cell.book = bookFor(indexPath: indexPath)
        
        return cell
    }
    
    func bookFor(indexPath: IndexPath) -> Book {
        return bookController.books[indexPath.item]
    }
    


}
