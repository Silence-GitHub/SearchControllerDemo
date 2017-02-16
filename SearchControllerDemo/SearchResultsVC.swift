//
//  SearchResultsVC.swift
//  SearchControllerDemo
//
//  Created by Kaibo Lu on 2017/2/14.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class SearchResultsVC: UITableViewController, UISearchResultsUpdating {

    var allStrings: [String]
    private var strings: [String] = []
    
    init(allStrings: [String]) {
        self.allStrings = allStrings
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = strings[indexPath.row]
        return cell
    }
    
    // MARK: - UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
        print("Is hidden:", searchController.searchResultsController!.view.isHidden)
//        searchController.searchResultsController?.view.isHidden = false
        
        strings.removeAll()
        if let text = searchController.searchBar.text?.uppercased(), !text.isEmpty {
            strings = allStrings.filter { $0.contains(text) }
        }
        tableView.reloadData()
    }

}
