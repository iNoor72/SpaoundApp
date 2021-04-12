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
    
    var workingSpaceData: WorkingSpace?
    
    override func viewDidLoad() {
        //scrollView.alwaysBounceVertical = true
//        scrollView.showsHorizontalScrollIndicator = false
        bookingButton.layer.cornerRadius = 16.0
    }

    @IBAction func bookingBottonTapped(_ sender: UIButton) {
        //print something as an alert for the user
    }
}
