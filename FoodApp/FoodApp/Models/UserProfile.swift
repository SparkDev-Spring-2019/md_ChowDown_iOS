//
//  UserProfile.swift
//  FoodApp
//
//  Created by Cassandra Zuria on 3/31/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import Foundation

struct UserProfile: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var address: String
    var city: String
    var state: String
    var zipCode: String
    var fullAddress: String
    var preferences: [String]
    var ordersRef: String
    var profileImageUrl: String?
    
    static var currentUserProfile: UserProfile?
    
    var dictionary: [String: Any] {
        var dictionary = [String: Any]()
        dictionary["firstName"] = firstName
        dictionary["lastName"] = lastName
        dictionary["email"] = email
        dictionary["address"] = address
        dictionary["city"] = city
        dictionary["state"] = state
        dictionary["zipCode"] = zipCode
        dictionary["fullAddress"] = fullAddress
        dictionary["preferences"] = preferences
        dictionary["profileImageUrl"] = profileImageUrl
        return dictionary
    }
    
}
