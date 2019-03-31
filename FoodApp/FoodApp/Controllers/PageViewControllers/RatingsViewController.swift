//
//  RatingsViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 3/21/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit
import Foundation

class RatingsViewController: UITableViewController, Pages {
 
    // MARK: Variables
    let text = ["You can't do this – UIStackView is a non-drawing view, meaning that drawRect() is never called ",
                "If you desperately want a background color, consider placing the stack view inside another UIView and giving that view a background color.",
                "This is part of the Swift Knowledge Base, a free, searchable collection of solutions for common iOS questions.",
                "Xcode offers to fix the problem. But you can do it yourself by adjusting one of the name label constraints. Head back to Main.storyboard and select the name label. In the Size Inspector, find the Trailing Space constraint and click Edit."
                ]
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // MARK: Helpers
    func setupTableView() {
        tableView.register(UINib(nibName: "RatingsTableViewCell", bundle: nil), forCellReuseIdentifier: "RatingsTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 250
        tableView.allowsSelection = false
    }
}

extension RatingsViewController {
    //MARK: TableView Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatingsTableViewCell", for: indexPath) as! RatingsTableViewCell
        cell.textView.text = text[indexPath.row % text.count]
        return cell
    }
}
