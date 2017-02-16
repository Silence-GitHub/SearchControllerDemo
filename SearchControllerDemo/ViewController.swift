//
//  ViewController.swift
//  SearchControllerDemo
//
//  Created by Kaibo Lu on 2017/2/14.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    private var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Present", style: .plain, target: self, action: #selector(showSearchController))
        
        let searchResultsVC = SearchResultsVC(allStrings: allStrings)
        searchController = UISearchController(searchResultsController: searchResultsVC)
        searchController.searchResultsUpdater = searchResultsVC;
        
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.tableHeaderView = searchController.searchBar;
        tableView.tableFooterView = UIView()
        
        definesPresentationContext = true;
    }
    
    func showSearchController() {
//        present(searchController, animated: true, completion: nil)
//        searchController.isActive = true
        searchController.searchBar.becomeFirstResponder()
    }
    
    // MARK: - Table view data source
    
    private let allStrings: [String] = ["ABC", "BCD", "CDE", "DEF", "EFG", "HIJ", "IJK"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allStrings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = allStrings[indexPath.row]
        return cell
    }

}

