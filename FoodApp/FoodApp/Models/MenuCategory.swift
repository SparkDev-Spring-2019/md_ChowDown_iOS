//
//  MenuCategory.swift
//  FoodApp
//
//  Created by Cassandra Zuria on 3/30/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import Foundation

struct MenuCategory: Codable {
    
    let categoryId: String
    var menuItemsId: [String]?
    
    init(categoryId: String) {
        self.categoryId = categoryId
    }
    
    var dictionary: [String: Any] {
        var dictionary = [String: Any]()
        dictionary["categoryId"] = categoryId
        return dictionary
    }
}
