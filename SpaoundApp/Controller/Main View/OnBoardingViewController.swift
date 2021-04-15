//
//  MainViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 06/04/2021.
//

import UIKit

class OnBoardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let imagesArray =  [#imageLiteral(resourceName: "image1"), #imageLiteral(resourceName: "image2"), #imageLiteral(resourceName: "image3")]
    private let firstTextArray = ["You can find any place here","Find your place where you can study","Save money when booking with us"]
    private let secondTextArray = ["Good mood good place, let's go!","It’s hard to find a quiet place to study.","Save more money was never easy."]
    
    private let thirdTextArray = ["Happy day with your favorite mood.","Spaound allows you to see place reviews.","Spaound will make you a lot of offers."]
    
    override func viewDidLoad() {
        collectionView.register(UINib(nibName: "OnBoardingCell", bundle: nil), forCellWithReuseIdentifier: "OnBoardingCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    @IBAction func nextPressed(_ sender: UIButton) {
        
    }
    @IBAction func skipPressed(_ sender: UIButton) {
        //Skip to view HomePageViewController
    }
}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCell", for: indexPath) as! OnBoardingCell
        cell.imageView.image = imagesArray[indexPath.row]
        cell.firstLabel.text = firstTextArray[indexPath.row]
        cell.secondLabel.text = secondTextArray[indexPath.row]
        cell.thirdLabel.text = thirdTextArray[indexPath.row]
        cell.progressIndicator.progress = Float(indexPath.row) * 30
        
        return cell
    }
    
}
