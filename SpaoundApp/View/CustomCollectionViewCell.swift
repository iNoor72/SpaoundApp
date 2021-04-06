//
//  CustomCollectionViewCell.swift
//  SpaoundApp
//
//  Created by Noor Walid on 06/04/2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var firstFeatureLabel: UILabel!
    @IBOutlet weak var secondFeatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
