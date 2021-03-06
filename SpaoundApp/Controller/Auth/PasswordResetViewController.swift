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
        super.viewDidLoad()
        emailTextField.layer.cornerRadius = 16.0
        resetButton.layer.cornerRadius = 16.0
        //navigationController?.isNavigationBarHidden = false
    }
    @IBAction func resetTapped(_ sender: UIButton) {
        if let email = emailTextField.text {
            Auth.auth().sendPasswordReset(withEmail: email) { [weak self] (error) in
                let alert = UIAlertController(title: "Something Wrong happend.", message: "There was an error with your email, please enter your email again.", preferredStyle: .alert)
                let action = UIAlertAction(title: "Dismiss", style: .cancel) { action in
                    print("There was an error restoring your password, the error is \(error.debugDescription).")
                }
                
            }
        }
        
        let destination = storyboard?.instantiateViewController(identifier: "") as! HomePageViewController
        destination.navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
}
