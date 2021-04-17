//
//  WorkingPlaceViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 11/04/2021.
//

import UIKit

class WorkingPlaceViewController: UIViewController {
    @IBOutlet weak var workingSpaceImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceButton: UIButton!
    @IBOutlet weak var normalPriceLabel: UILabel!
    @IBOutlet weak var meetingPriceLabel: UILabel!
    @IBOutlet weak var smallPriceLabel: UILabel!
    
    var workingSpaceData: WorkingSpace?
    
    override func viewDidLoad() {
        priceButton.layer.cornerRadius = 16.0
    }

    @IBAction func bookingBottonTapped(_ sender: UIButton) {
        //print something as an alert for the user
    }
}
