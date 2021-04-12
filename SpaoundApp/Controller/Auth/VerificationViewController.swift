//
//  VerificationViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 05/04/2021.
//

import UIKit
import FirebaseAuth

class VerificationViewController: UIViewController {

    @IBOutlet weak var createButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        createButton.layer.cornerRadius = 16.0
    }

    @IBAction func signUpTapped(_ sender: UIButton) {
        //implement the signup for user here with data passed from signup screen
        
        User(name: "", email: "", password: "", phoneNumber: "")
    }
    
}
