//
//  MenuCategory.swift
//  FoodApp
//
//  Created by Cassandra Zuria on 3/22/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import Foundation

struct MenuCategory: Codable {
    
    var categoryId: String
    var menuItemsId: String
    
    init(categoryId: String, menuItemsId: String) {
        self.categoryId = categoryId
        self.menuItemsId = menuItemsId
    }
    
}
