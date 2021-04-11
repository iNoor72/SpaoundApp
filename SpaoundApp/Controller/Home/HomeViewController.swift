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
        
        fetchPopularSpaces()
        fetchRecommendedSpaces()
    }
    
}

var popularWorkingSpaces : WorkingSpace?
var recommendedWorkingSpaces : WorkingSpace?

//MARK:- TableView Functions
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(recommendedWorkingSpaces?.places.count)" + " I'm in rows")
        return recommendedWorkingSpaces?.places.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = recommendedWorkingSpaces?.places[indexPath.row].name
        cell.addressLabel.text = recommendedWorkingSpaces?.places[indexPath.row].address
        cell.priceLabel.text = "\(String(describing: recommendedWorkingSpaces?.places[indexPath.row].price))"
        
        return cell
    }
}


//MARK:- CollectionView Functions
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularWorkingSpaces?.places.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.nameLabel.text = popularWorkingSpaces?.places[indexPath.row].name
        cell.priceLabel.text = "\(String(describing: popularWorkingSpaces?.places[indexPath.row].price))"
        cell.firstFeatureLabel.text = "Comfort"
        cell.secondFeatureLabel.text = "Comfort"
        
        return cell
    }
    
    //MARK:- Fetching Data Functions
    
    func fetchPopularSpaces() {
        let url = Router.popularPlaces
        
        //always gives an error!
        AF.request(url).responseDecodable { (response: (DataResponse<WorkingSpace, AFError>)) in
            switch response.result {
            case .success(let data):
                print("succes")
                print(data)
                popularWorkingSpaces = data
                self.tableView.reloadData()
                
            case .failure(let error):
                print("error with network")
                print(error.localizedDescription)
            }
            
            
        }
    }
    
}

func fetchRecommendedSpaces() {
    let url = Router.recommendedPlaces
    
    //always gives an error!
    AF.request(url).responseDecodable { (response: (DataResponse<WorkingSpace, AFError>)) in
        switch response.result {
        case .success(let data):
            recommendedWorkingSpaces = data
        case .failure(let error):
            print("error with network")
            print(error.localizedDescription)
        }
    }
}

