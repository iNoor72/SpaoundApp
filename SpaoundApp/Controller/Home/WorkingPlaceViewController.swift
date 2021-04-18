//
//  WorkingPlaceViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 11/04/2021.
//

import UIKit

class WorkingPlaceViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var priceButton: UIButton!
    @IBOutlet weak var normalPriceLabel: UILabel!
    @IBOutlet weak var meetingPriceLabel: UILabel!
    @IBOutlet weak var smallPriceLabel: UILabel!
    
    var workingSpaceData: Place?
    
    override func viewDidLoad() {
        let price = Double(workingSpaceData?.price ?? 0)

        priceButton.layer.cornerRadius = 16.0
        nameLabel.text = workingSpaceData?.name
        addressLabel.text = workingSpaceData?.address
        priceButton.setTitle("L.E \(price)/day", for: .normal)
        smallPriceLabel.text = "- L.E \(price*0.8)/ 1 Day (8 Hours)"
        meetingPriceLabel.text = "- L.E \(price*2)/ 1 Day (8 Hours)"
        normalPriceLabel.text = "- L.E \(price)/ 1 Day (8 Hours)"
        navigationController?.isNavigationBarHidden = false
    }

    @IBAction func bookingBottonTapped(_ sender: UIButton) {
        //print something as an alert for the user
    }
}
