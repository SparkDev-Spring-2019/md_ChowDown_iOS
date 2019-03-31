//
//  User.swift
//  FoodApp
//
//  Created by Cassandra Zuria on 3/22/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import Foundation

struct UserProfile: Codable {
    
    var fName: String
    var lName: String
    var email: String
    var profileImgUrl: String
    var fullAddress: Address
    var preferences: [String]
    
    static var currentUser: UserProfile?
    
    var dictionary: [String: Any] {
        
        var dictionary = [String: Any]()
        dictionary[""] = fName
        
        return dictionary
    }
}
