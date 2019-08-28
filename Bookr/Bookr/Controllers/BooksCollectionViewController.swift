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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowBookDetailsSegue" {
            guard let bookIndex = collectionView.indexPathsForSelectedItems?.first?.item, let destinationVC = segue.destination as? BookDetailViewController else { return }
            
            destinationVC.bookController = bookController
            
            let book = bookController.books[bookIndex]
            destinationVC.book = book
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
