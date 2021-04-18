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
    
    var workingSpaceData: Place?
    var matchingWorkingSpaces: WorkingSpace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "TVCell")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        //Show the matching WorkingSpaces with the text in the searchBar
    }

}

//MARK:- TableView Delegate & DataSource Functions

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(matchingWorkingSpaces?.places.count ?? 0)")
        return matchingWorkingSpaces?.places.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath) as! CustomTableViewCell
        //Maybe using Realm to fetch data, or maybe using the API call again
        
        cell.nameLabel.text = matchingWorkingSpaces?.places[indexPath.row].name
        cell.addressLabel.text = matchingWorkingSpaces?.places[indexPath.row].address
        cell.priceLabel.text = "\(matchingWorkingSpaces?.places[indexPath.row].price ?? 0)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Needs some work
        
        let destination = storyboard?.instantiateViewController(identifier: "WorkingPlaceViewController") as! WorkingPlaceViewController
        destination.workingSpaceData = self.workingSpaceData
        navigationController?.pushViewController(destination, animated: true)
    }
    
    
}
