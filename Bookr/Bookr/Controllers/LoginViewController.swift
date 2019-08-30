//
//  LoginViewController.swift
//  Bookr
//
//  Created by Aaron on 8/22/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    enum LoginType {
        case signUp
        case signIn
    }
    
    
    let loginButton = UIButton()
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let toggle = UISegmentedControl(items: ["sign up", "log in"])
    var bookController = BookController()
    var apiController = APIController()
    var loginType = LoginType.signIn
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        usernameTextField.delegate = self
        
      
    }
    
    func setupLayout() {
        //Background Image
        backgroundImage.image = UIImage(named: "BookShelf")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
       //Login/SignUp toggle
        view.addSubview(toggle)
        
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.tintColor = .white
        toggle.backgroundColor = .red
        toggle.addTarget(self, action: #selector(signInTypeChanged), for: .valueChanged)
        toggle.layer.cornerRadius = 8.0
        toggle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        toggle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 75).isActive = true
        
        
        
        // Login Button
        loginButton.title(for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.setTitle("log in", for: .normal)
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginButton.backgroundColor = .red
        loginButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        // textView For Username
        view.addSubview(usernameTextField)
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Enter username here"
        usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        usernameTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        usernameTextField.backgroundColor = .lightGray

        
        // Password TextView
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "enter password here"
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        passwordTextField.backgroundColor = .lightGray
        passwordTextField.isSecureTextEntry = true
        
   
    }
    
    // Alert code that alerts user of something. Input params title and message
    func alertMessage(title: String, message: String) {
 
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        
    }
 
    // TODO: - Create network call up to API to check if user has account and login if yes.
    @objc func loginButtonTapped(_ sender: UIButton) {
        let api = apiController
        guard let password = passwordTextField.text, let username = usernameTextField.text else { return }
        let user = User(id: 55, username: username, password: password, roles: ["user"], token: "99")
        if username.isEmpty || password.isEmpty {
            alertMessage(title: "Must fill Out Completely", message: "Please fill out both username and password fields.")
        }
        
        if username.contains(" ") {
            alertMessage(title: "No Spaces", message: "Username Must Not Contain Spaces.")
            usernameTextField.text = ""
        }
        
        
        if loginType == .signUp {
            api.signUp(with: user) { error in
                if let error = error {
                    print("Error occured during sign up: \(error)")
                } else {
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Sign Up Successful", message: "Now Please log in.", preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(alertAction)
                        self.present(alertController, animated: true, completion: {
                            self.loginType = .signIn
                            self.loginButton.setTitle("Log In", for: .normal)
                            self.clearTextFields()
                        
                        })
                    }
                }
            }
          } else if loginType == .signIn {
            api.signIn(with: user) { error in
                if let error = error {
                    print("Error occured during sign in: \(error)")
                } else {
                    DispatchQueue.main.async {
                        self.clearTextFields()
                        self.performSegue(withIdentifier: "toMain", sender: self)
                        
                    }
                  }
                }
              }
            }
            
    
    @objc func signInTypeChanged() {
        if toggle.selectedSegmentIndex == 0 {
            // 0 is equal to sign up
            loginType = .signUp
            loginButton.setTitle("Sign Up", for: .normal)
        } else {
            // 1 is equal to sign in
            loginType = .signIn
            loginButton.setTitle("Log In", for: .normal)
        }
    }
    
    func clearTextFields() {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Navigation
    // Segue Information to
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMain" {
            if let vc = segue.destination as? BooksCollectionViewController { 
                vc.delegate = self as? LoginDelegate
                if let token = apiController.user?.token {
                    vc.booksToken = token
                    }
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

