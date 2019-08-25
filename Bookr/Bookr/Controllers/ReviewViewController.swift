//
//  ReviewViewController.swift
//  Bookr
//
//  Created by John Kouris on 8/25/19.
//  Copyright © 2019 Bookr Team. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet weak var headlineTextField: UITextField!
    @IBOutlet weak var reviewContentTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
}
