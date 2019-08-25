//
//  BookDetailViewController.swift
//  Bookr
//
//  Created by John Kouris on 8/25/19.
//  Copyright © 2019 Bookr Team. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    
    @IBOutlet weak var bookReviewsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func deleteButtonTapped(_ sender: UIBarButtonItem) {
    }
    

}
