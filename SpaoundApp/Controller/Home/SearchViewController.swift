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
    
    override func viewDidLoad() {
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        //Show the matching WorkingSpaces with the text in the searchBar
    }

}

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
