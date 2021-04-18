//
//  SearchViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 06/04/2021.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var workingSpaceData: WorkingSpace?
    
    override func viewDidLoad() {
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        //Show the matching WorkingSpaces with the text in the searchBar
    }

}

//MARK:- TableView Delegate & DataSource Functions

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath) as! CustomTableViewCell
        //Maybe using Realm to fetch data, or maybe using the API call again
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Needs some work
        
        let destination = storyboard?.instantiateViewController(identifier: "WorkingPlaceViewController") as! WorkingPlaceViewController
        
        destination.nameLabel.text = workingSpaceData?.places[indexPath.row].name
        destination.priceButton.titleLabel?.text = workingSpaceData?.places[indexPath.row].address
        
        let price = Double(workingSpaceData?.places[indexPath.row].price ?? 0)
        destination.normalPriceLabel.text = String(format: "%.2f", "\(price)") //Cell price
        destination.meetingPriceLabel.text = String(format: "%.2f", "\(price * 2)") //Cell price * 2
        destination.smallPriceLabel.text = String(format: "%.2f", "\(price * 0.8)")//Cell price * 0.8

        navigationController?.pushViewController(destination, animated: true)
    }
    
    
}
