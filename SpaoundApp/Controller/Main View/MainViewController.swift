//
//  MainViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 06/04/2021.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        collectionView.register(UINib(nibName: "OnBoardingCell", bundle: nil), forCellWithReuseIdentifier: "OnBoardingCell")
    }

    @IBAction func nextPressed(_ sender: UIButton) {
    }
    @IBAction func skipPressed(_ sender: UIButton) {
        //Skip to view HomePageViewController
    }
    
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCell", for: indexPath) as! OnBoardingCell
        
        return cell
    }
    
    
}
