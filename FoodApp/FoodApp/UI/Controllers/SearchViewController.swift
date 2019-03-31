//
//  SearchViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 3/15/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    var data = [MenuItem]()
    
    var filteredData = [MenuItem]()
    
    lazy var resultSearchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.dimsBackgroundDuringPresentation = false
        controller.searchBar.sizeToFit()
        
        return controller
    }()

    init() {
        super.init(style: .plain)
        
        title = "Search"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.tableHeaderView = resultSearchController.searchBar

        //tableView.register(UINib(), forCellReuseIdentifier: "")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}
