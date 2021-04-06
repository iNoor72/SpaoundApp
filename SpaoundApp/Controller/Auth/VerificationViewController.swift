//
//  VerificationViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 05/04/2021.
//

import UIKit

class VerificationViewController: UIViewController {

    @IBOutlet weak var createButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        createButton.layer.cornerRadius = 16.0
    }

    @IBAction func signUpTapped(_ sender: UIButton) {
    }
    
}
