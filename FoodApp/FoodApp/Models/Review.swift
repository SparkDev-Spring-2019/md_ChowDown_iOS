//
//  Review.swift
//  FoodApp
//
//  Created by Cassandra Zuria on 4/2/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import Foundation
import Firebase
import CodableFirebase

extension Timestamp: TimestampType {}

struct Review: Codable {
    
    var timestamp: Timestamp
    var reviewMsg: String
    var reviewerId: String
    var reviewerName: String
    var foodId: String
    var rating: Double
    
}
