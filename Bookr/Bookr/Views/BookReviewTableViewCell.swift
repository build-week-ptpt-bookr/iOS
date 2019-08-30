//
//  BookReviewTableViewCell.swift
//  Bookr
//
//  Created by John Kouris on 8/25/19.
//  Copyright © 2019 Bookr Team. All rights reserved.
//

import UIKit

class BookReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var reviewHeadlineLabel: UILabel!
    @IBOutlet weak var reviewerLabel: UILabel!
    @IBOutlet weak var reviewContentLabel: UILabel!
    
    var review: Review? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let review = review else { return }
        
        reviewHeadlineLabel.text = review.title
        reviewerLabel.text = review.username
        reviewContentLabel.text = review.comment
        
    }

}
