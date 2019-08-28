//
//  BookCollectionViewCell.swift
//  Bookr
//
//  Created by John Kouris on 8/25/19.
//  Copyright © 2019 Bookr Team. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    
    var book: Book? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let book = book else { return }
        
        bookImageView.image = UIImage(named: book.coverUrl)
        bookTitleLabel.text = book.title
    }
    
}
