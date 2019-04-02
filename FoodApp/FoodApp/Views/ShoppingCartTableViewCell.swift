//
//  ShoppingCartTableViewCell.swift
//  FoodApp
//
//  Created by Cassandra Zuria on 4/1/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class ShoppingCartTableViewCell: UITableViewCell {
    
    static let reuseID = String(describing: ShoppingCartTableViewCell.self)

    @IBOutlet weak var menuItemTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
