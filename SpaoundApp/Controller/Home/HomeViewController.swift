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
    var allWorkingSpaces: WorkingSpace = WorkingSpace(places: [Place]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "TVCell")
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CVCell")
        navigationController?.isNavigationBarHidden = true
        
        fetchPopularSpaces()
        fetchRecommendedSpaces()
        //setAllWorkingSpacesData()
    }
    
    //MARK:- Fetching functions
    func fetchPopularSpaces() {
        let url = Router.popularPlaces
        AF.request(url).responseDecodable { [weak self](response: (DataResponse<WorkingSpace, AFError>)) in
            switch response.result {
            case .success(let data):
                print("succes")
                print(data)
                self?.popularWorkingSpaces = data
                self?.allWorkingSpaces.places.append(contentsOf: data.places)
                
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
                self?.allWorkingSpaces.places.append(contentsOf: data.places)
                self?.setAllWorkingSpacesData()
                
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
                
            case .failure(let error):
                print("error with network")
                print(error.localizedDescription)
            }
        }
    }
    
    func setAllWorkingSpacesData() {
//        guard allWorkingSpaces != nil else {
//            return
////        }
        let destination = storyboard?.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
        destination.matchingWorkingSpaces = allWorkingSpaces
        tabBarController?.present(destination, animated: true, completion: nil)
//        for i in 0...allWorkingSpaces.places.count-1 {
//            print("\(allWorkingSpaces.places[i].name)")
//        }
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
        let destination = storyboard?.instantiateViewController(identifier: "WorkingPlaceViewController") as! WorkingPlaceViewController
        destination.workingSpaceData = popularWorkingSpaces?.places[indexPath.row]
        navigationController?.pushViewController(destination, animated: true)
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destination = storyboard?.instantiateViewController(identifier: "WorkingPlaceViewController") as! WorkingPlaceViewController
        destination.workingSpaceData = recommendedWorkingSpaces?.places[indexPath.row]
        navigationController?.pushViewController(destination, animated: true)
    }
    
}
