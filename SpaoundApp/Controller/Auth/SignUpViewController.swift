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
    
    var validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.layer.cornerRadius = 16.0
        emailTextField.layer.cornerRadius = 16.0
        phoneNumberTextField.layer.cornerRadius = 16.0
        passwordTextField.layer.cornerRadius = 16.0
        nextButton.layer.cornerRadius = 16.0
        //navigationController?.isNavigationBarHidden = false
    }
    
    //It works, need to check for empty fields.
    @IBAction func nextTapped(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text, let number = phoneNumberTextField.text, !(emailTextField.text?.isEmpty ?? true), !(nameTextField.text?.isEmpty ?? true), !(passwordTextField.text?.isEmpty ?? true), !(phoneNumberTextField.text?.isEmpty ?? true) {
            
            //Check for syntax of each one of them
            if validator.isValidInput(email: email, password: password, name: name, phone: number){
                
                //Create a user after the checking, it must be sent to the verify screen
                Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] result, error in
                    guard error == nil else {
                        let alert = UIAlertController(title: "Something went bad.", message: "Please check the data entered.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Return", style: .cancel, handler: nil))
                        self?.present(alert, animated: true)
                        return
                    }
                }
                //                let user = User(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, phoneNumber: phoneNumberTextField.text!)
                
                //Present the verification controllers with the data
                
                func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                    if segue.identifier == "verifySegue" {
                        let destination = segue.destination as! VerificationViewController
                        destination.name = name
                        destination.email = email
                        destination.password = password
                        destination.phoneNumber = number
                    }
                }
                
            }
            
            let alert = UIAlertController(title: "Wrong Data.", message: "You entered wrong data, please check entered data.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Return", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }
    
    
}
