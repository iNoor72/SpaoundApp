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
    
    //let signInUser = realm.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signOutButton.layer.cornerRadius = 16.0
        //phoneLabel.text = user.phoneNumber
        //usernameLabel.text = user.username
        //profileImage.image = user.image

    }

    @IBAction func signOutTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("\(error)")
        }
        
        //Need changing to make it better, not pop-off windows
        let destination = storyboard?.instantiateViewController(identifier: "HomePageVC") as! HomePageViewController
        destination.navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(destination, animated: true)
    }
}
