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
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 16.0
//        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        let destination = storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginViewController
        self.navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(destination, animated: true)
    }
    @IBAction func registerTapped(_ sender: UIButton) {
        let destination = storyboard?.instantiateViewController(identifier: "RegisterVC") as! SignUpViewController
        self.navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(destination, animated: true)
    }
}
