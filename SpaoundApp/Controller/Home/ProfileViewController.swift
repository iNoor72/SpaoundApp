//
//  ProfileViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 06/04/2021.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        signOutButton.layer.cornerRadius = 16.0

    }

    @IBAction func signOutTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("\(error)")
        }
        
        //Need changing to make it better, not pop-off windows
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        self.present((storyboard?.instantiateViewController(withIdentifier: "HomePageVC")) as! HomePageViewController, animated: true, completion: nil)
    }
}
