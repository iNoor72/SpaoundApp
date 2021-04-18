//
//  OnBoardingViewController2.swift
//  SpaoundApp
//
//  Created by Noor Walid on 16/04/2021.
//

import UIKit

class OnBoardingViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func skipTapped(_ sender: UIBarButtonItem) {
        let destination = storyboard?.instantiateViewController(identifier: "HomePageVC") as! HomePageViewController
        navigationController?.pushViewController(destination, animated: true)
    }
}
