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
    var filteredWorkingSpaces: WorkingSpace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "TVCell")
        //Dismiss keyboard
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if let allPlaces = allWorkingSpaces {
            for index in 0...allPlaces.places.count-1{
                if searchBar.text == allPlaces.places[index].name {
                    tableView.cellForRow(at: IndexPath(item: 0, section: 0))
                }
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        filteredWorkingSpaces?.places.removeAll()
        if let spaces = allWorkingSpaces?.places {
            for place in spaces {
                if place.name.lowercased() == searchText.lowercased(){
                    filteredWorkingSpaces?.places.append(place)
                }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

//MARK:- TableView Delegate & DataSource Functions

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !(filteredWorkingSpaces?.places.isEmpty ?? true) {
            return (filteredWorkingSpaces?.places.count)!
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
