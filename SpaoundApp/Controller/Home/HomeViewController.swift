//
//  HomeViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 05/04/2021.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "TVCell")
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CVCell")
    }

}

//MARK:- TableView Functions
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = "Noor"
        cell.placeImage.image = UIImage(systemName: "home")
        
        return cell
    }
}


//MARK:- CollectionView Functions
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.nameLabel.text = "Noor"
        cell.priceLabel.text = "20"
        return cell
    }
    
//MARK:- Fetching Data Functions
    
    func fetchPopularSpaces() {
        let url = Router.baseURL

        //Make request with AF.request() method to fetch data.
    }
    
    func fetchRecommendedSpaces() {
        let url = Router.baseURL

        //Make request with AF.request() method to fetch data.
        
    }
}
