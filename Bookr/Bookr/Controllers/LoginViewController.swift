//
//  LoginViewController.swift
//  Bookr
//
//  Created by Aaron on 8/22/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginButton = UIButton()
    let signUpButton = UIButton()
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    
    var user: User?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        usernameTextField.delegate = self
        
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
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.setTitle("Log In", for: .normal)
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginButton.backgroundColor = .red
        loginButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Sign Up Button
        signUpButton.title(for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        signUpButton.setTitle("Sign Up", for: .normal)
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 75).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signUpButton.backgroundColor = .red
        signUpButton.isHidden = true
        
        
        // textView For Username
        view.addSubview(usernameTextField)
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Enter Username Here"
        usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        usernameTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        usernameTextField.backgroundColor = .lightGray

        
        // Password TextView
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Enter Password Here"
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        passwordTextField.backgroundColor = .lightGray
        passwordTextField.isSecureTextEntry = true
        
   
    }
 
    // TODO: - Create network call up to API to check if user has account and login if yes.
    @objc func loginButtonTapped(sender: UIButton) {
        guard let pass = passwordTextField.text, let user = usernameTextField.text else { return }
    
        if user.isEmpty || pass.isEmpty {
            alertMessage(title: "Must fill Out Completely", message: "Please fill out both username and password fields.")
        }
        
        if user.contains(" ") {
            alertMessage(title: "No Spaces", message: "Username Must Not Contain Spaces.")
            usernameTextField.text = ""
        } else {
            DispatchQueue.main.async {
                user.
                self.performSegue(withIdentifier: "toMain", sender: self)
            }
        }

 
    
    }
    // TODO: - Create network call that adds user into back in and log them in
    @objc func signUpButtonTapped(sender: UIButton) {
        guard let pass = passwordTextField.text, let user = usernameTextField.text else { return }
        
        if user.isEmpty || pass.isEmpty {
            alertMessage(title: "Must fill Out Completely", message: "Please fill out both username and password fields.")
        }
        
    }
    

    func alertMessage(title: String, message: String) {
        
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
       
    }
    
    // MARK: - Navigation
    // Segue Information to
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMain" {
            if let vc = segue.destination as? SettingsViewController { 
                vc.delegate = self as? LoginDelegate
            }
        }
    }
    

}

// MARK: - Keyboard Management
extension LoginViewController: UITextFieldDelegate {

    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Keyboard appears after tapping fields.
        if let text = textField.text, text.isEmpty {
            switch textField {
            case usernameTextField: usernameTextField.becomeFirstResponder()
            case passwordTextField: passwordTextField.becomeFirstResponder()
            default: textField.resignFirstResponder()
            }
        }
        return true
    }
    

    
    
}
