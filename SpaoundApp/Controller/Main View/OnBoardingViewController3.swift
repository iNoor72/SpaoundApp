//
//  OnBoardingViewController3.swift
//  SpaoundApp
//
//  Created by Noor Walid on 16/04/2021.
//

import UIKit

class OnBoardingViewController3: UIViewController {
    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStartedButton.layer.cornerRadius = 16.0
    }
    @IBAction func getStartedTapped(_ sender: UIButton) {
        let destination = storyboard?.instantiateViewController(identifier: "HomePageVC") as! HomePageViewController
        self.navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(destination, animated: true)
    }
}
