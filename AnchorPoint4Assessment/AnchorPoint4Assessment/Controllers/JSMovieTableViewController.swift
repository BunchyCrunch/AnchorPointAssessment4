//
//  JSMovieTableViewController.swift
//  AnchorPoint4Assessment
//
//  Created by Josh Sparks on 10/11/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

import UIKit

class JSMovieTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = 150
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        JSMovieController.shared().fetchMovie(searchText) { (results) in
            JSMovieController.shared().movies = results
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.searchBar.text = ""
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return JSMovieController.shared().movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? JSMovieTableViewCell else { return UITableViewCell()}
        
        let movie = JSMovieController.shared().movies[indexPath.row]
        
        cell.titleLabel.text = movie.title
        cell.ratingLabel.text = "\(movie.vote_average)"
        cell.descriptionLabel.text = movie.overview
        
        return cell
    }
    
    
}
