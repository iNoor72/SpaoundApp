//
//  MainViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 06/04/2021.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    private let imagesArray =  [#imageLiteral(resourceName: "image1"), #imageLiteral(resourceName: "image2"), #imageLiteral(resourceName: "image3")]
    private let firstTextArray = ["","",""]
    private let secondTextArray = ["","",""]
    
    private let thirdTextArray = ["","",""]
    
    override func viewDidLoad() {
    }
    
    
    @IBAction func skipTapped(_ sender: UIBarButtonItem) {
        let destination = storyboard?.instantiateViewController(identifier: "HomePageVC") as! HomePageViewController
        self.navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(destination, animated: true)
        
    }
}
