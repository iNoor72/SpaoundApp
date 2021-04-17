//
//  VerificationViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 05/04/2021.
//

import UIKit
import FirebaseAuth

class VerificationViewController: UIViewController {
    
    var name: String?
    var email: String?
    var password: String?
    var phoneNumber: String?
    @IBOutlet weak var firstDigit: UITextField!
    @IBOutlet weak var secondDigit: UITextField!
    @IBOutlet weak var thirdDigit: UITextField!
    @IBOutlet weak var fourthDigit: UITextField!
    
    
    @IBOutlet weak var createButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        createButton.layer.cornerRadius = 16.0
    }
    

    @IBAction func signUpTapped(_ sender: UIButton) {
        //implement the signup for user here with data passed from signup screen
        
        if let safeName = name, let safeEmail = email, let safePassword = password, let safeNumber = phoneNumber{
            //Use Firebase to verify using phone numbers
            
            let user = User(name: safeName, email: safeEmail, password: safePassword, phoneNumber: safeNumber)
            //realm.add(user)
            
            //We can add the navigation to the completion
            Auth.auth().createUser(withEmail: safeEmail, password: safePassword, completion: nil)
            
        }
    }
    
    @IBAction func resendCodeTapped(_ sender: UIButton) {
        //Use Firebase to resend code
    }
}
