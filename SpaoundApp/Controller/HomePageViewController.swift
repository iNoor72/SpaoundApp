//
//  HomePageViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 05/04/2021.
//

import UIKit

class HomePageViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
//        loginButton.layer.cornerRadius = 16.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loginButton.layer.cornerRadius = 16.0
    }

}
