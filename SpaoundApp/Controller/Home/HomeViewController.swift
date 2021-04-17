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
    
    var popularWorkingSpaces : WorkingSpace?
    var recommendedWorkingSpaces : WorkingSpace?
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "TVCell")
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CVCell")
        
        fetchPopularSpaces()
        fetchRecommendedSpaces()
    }
    
    func fetchPopularSpaces() {
        let url = Router.popularPlaces
        AF.request(url).responseDecodable { [weak self](response: (DataResponse<WorkingSpace, AFError>)) in
            switch response.result {
            case .success(let data):
                print("succes")
                print(data)
                self?.popularWorkingSpaces = data
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print("error with network")
                print(error.localizedDescription)
            }
        }
    }


    func fetchRecommendedSpaces() {
        let url = Router.recommendedPlaces
            AF.request(url).responseDecodable { [weak self] (response: (DataResponse<WorkingSpace, AFError>)) in
            switch response.result {
            case .success(let data):
                self?.recommendedWorkingSpaces = data
                
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
                
            case .failure(let error):
                print("error with network")
                print(error.localizedDescription)
            }
        }
    }
}



//MARK:- TableView Functions
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("\(popularWorkingSpaces?.places.count)" + " I'm in rows")
        return popularWorkingSpaces?.places.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = popularWorkingSpaces?.places[indexPath.row].name
        cell.addressLabel.text = popularWorkingSpaces?.places[indexPath.row].address
        cell.priceLabel.text = "\(popularWorkingSpaces?.places[indexPath.row].price ?? 0)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Needs some work
        navigationController?.pushViewController(WorkingPlaceViewController(), animated: true)
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ShowDetails" {
                let destination = segue.destination as! WorkingPlaceViewController
                destination.nameLabel.text = ""
                destination.priceButton.titleLabel?.text = ""
                destination.workingSpaceImage.image = UIImage()
                destination.normalPriceLabel.text = "" //Cell price
                destination.meetingPriceLabel.text = "" //Cell price * 2
                destination.smallPriceLabel.text = "" //Cell price * 0.8
                
            }
        }
    }
}


//MARK:- CollectionView Functions
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendedWorkingSpaces?.places.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.nameLabel.text = recommendedWorkingSpaces?.places[indexPath.row].name
        cell.priceLabel.text = "\(recommendedWorkingSpaces?.places[indexPath.row].price ?? 0)"
        cell.firstFeatureLabel.text = "Comfort"
        cell.secondFeatureLabel.text = "Comfort"
    
        return cell
    }
    
}
