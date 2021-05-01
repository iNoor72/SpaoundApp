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
    
    var allWorkingSpaces: WorkingSpace?
    var filteredWorkingSpaces: [Place]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "TVCell")
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        filteredWorkingSpaces?.removeAll()
        if !searchText.isEmpty {
            if let places = allWorkingSpaces?.places {
            for place in places {
                if searchText.lowercased() == place.name.lowercased() {
                    filteredWorkingSpaces?.append(place)
                }
            }
        }
    }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = false
            searchBar.text = ""
            searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

//MARK:- TableView Delegate & DataSource Functions

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !(filteredWorkingSpaces?.isEmpty ?? true) {
            return (filteredWorkingSpaces?.count)!
        }
        return allWorkingSpaces?.places.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath) as! CustomTableViewCell
        //Maybe using Realm to fetch data, or maybe using the API call again
        
        
            cell.nameLabel.text = allWorkingSpaces?.places[indexPath.row].name
            cell.addressLabel.text = allWorkingSpaces?.places[indexPath.row].address
            cell.priceLabel.text = "\(allWorkingSpaces?.places[indexPath.row].price ?? 0)"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = storyboard?.instantiateViewController(identifier: "WorkingPlaceViewController") as! WorkingPlaceViewController
        destination.workingSpaceData = self.allWorkingSpaces?.places[indexPath.row]
        navigationController?.pushViewController(destination, animated: true)
    }
    
    
}
