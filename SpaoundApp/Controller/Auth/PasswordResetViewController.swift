//
//  PasswordResetViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 05/04/2021.
//

import UIKit
import FirebaseAuth

class PasswordResetViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        emailTextField.layer.cornerRadius = 16.0
        resetButton.layer.cornerRadius = 16.0
    }
    @IBAction func resetTapped(_ sender: UIButton) {
        if let email = emailTextField.text {
            Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                //Better style --> Make UIAlert with the error.
                print("There was an error restoring your password, the error is \(error.debugDescription).")
            }
        }
        
    }
    
}
