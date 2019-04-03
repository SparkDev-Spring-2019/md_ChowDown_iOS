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
    
    
    var dictionary: [String: Any] {
        do {
            let jsonEncoder = JSONEncoder()
            jsonEncoder.dateEncodingStrategy = .secondsSince1970
            let jsonData = try jsonEncoder.encode(self)
            var json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
            json["timestamp"] = timestamp
            return json
        } catch {
            print("Error converting to json \(error.localizedDescription)")
            return [:]
        }
    }
}
