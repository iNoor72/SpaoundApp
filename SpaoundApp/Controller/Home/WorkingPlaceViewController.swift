//
//  WorkingPlaceViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 11/04/2021.
//

import UIKit

class WorkingPlaceViewController: UIViewController {
    @IBOutlet var workingImage: UIImageView!
    @IBOutlet var bookingButton: UIButton!
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        scrollView.alwaysBounceVertical = true
//        scrollView.showsHorizontalScrollIndicator = false
    }

    @IBAction func bookingBottonTapped(_ sender: UIButton) {
    }
}
