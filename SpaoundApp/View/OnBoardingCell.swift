//
//  OnBoardingCell.swift
//  SpaoundApp
//
//  Created by Noor Walid on 14/04/2021.
//

import UIKit

class OnBoardingCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var progressIndicator: UIProgressView!
    @IBOutlet weak var thirdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        progressIndicator.progress = 0.0
    }

}
