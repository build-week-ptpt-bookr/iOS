//
//  LoginViewController.swift
//  Bookr
//
//  Created by Aaron on 8/22/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{
    
    let loginButton = UIButton()
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func setupLayout() {
        //Background Image
        backgroundImage.image = UIImage(named: "BookShelf")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
       
        // Login Button
        loginButton.title(for: .normal)
        loginButton.setTitle("Log In", for: .normal)
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginButton.backgroundColor = .red
        loginButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // textView For Username
        usernameTextField.placeholder = "Enter Username Here"
//        usernameTextField.centerYAnchor.constraint
        
    
        // Password TextView
        passwordTextField.placeholder = "Enter Password Here"
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
