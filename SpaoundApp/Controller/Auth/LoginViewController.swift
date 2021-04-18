//
//  ViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 05/04/2021.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.layer.cornerRadius = 16.0
        passwordTextField.layer.cornerRadius = 16.0
        loginButton.layer.cornerRadius = 16.0
        //navigationController?.isNavigationBarHidden = false
    }
    
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
                //In case of failure in signing in.
                guard error == nil
                else{
                    let alert = UIAlertController(title: "Signing in failed.", message: "Your email or password is wrong. Try again.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: { (action) in
                    }))
                    self?.present(alert, animated: true)
                    return
                }
            }
        }
        
        UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
    
        //realm user to be signedIn
        //realm.getObject().isLogged = true
    }
    

}

