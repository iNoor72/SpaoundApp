//
//  SignUpViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 05/04/2021.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        nameTextField.layer.cornerRadius = 16.0
        emailTextField.layer.cornerRadius = 16.0
        phoneNumberTextField.layer.cornerRadius = 16.0
        passwordTextField.layer.cornerRadius = 16.0
        nextButton.layer.cornerRadius = 16.0
    }
    @IBAction func nextTapped(_ sender: UIButton) {
        if nameTextField != nil, emailTextField != nil, passwordTextField != nil, phoneNumberTextField != nil {
            //Check for syntax of each one of them
            
            //Create a user after the checking
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (Result, Error) in
                //Do something
            }
            let user = User(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, phoneNumber: phoneNumberTextField.text!)
            
            //Present the verification controllers
        }
    }
    
}
