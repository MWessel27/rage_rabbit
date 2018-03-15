//
//  Product.swift
//  rage_rabbit
//
//  Created by Anthony Cusimano on 3/14/18.
//  Copyright © 2018 persever. All rights reserved.
//

import UIKit
import os.log

class Product: NSObject, NSCoding {
    
    //MARK: properties
    
    var name: String
    var time: Int //0 am 2 pm 3 both
    var daily: Bool
    var days: [Bool] = [false, false, false, false, false, false, false]
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("products")
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let time = "time"
        static let daily = "daily"
        static let days = "days"
    }
    
    //Mark: Initialization

    init?(name: String, time: Int, daily: Bool, days: [Bool]) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        guard !name.isEmpty else {
            return nil
        }
        
        guard time >= 0 && time <= 23 else {
            return nil
        }

        self.name = name
        self.time = time
        self.daily = daily
        self.days = days
        
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(time, forKey: PropertyKey.time)
        aCoder.encode(daily, forKey: PropertyKey.daily)
        aCoder.encode(days, forKey: PropertyKey.days)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Product object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let time = aDecoder.decodeObject(forKey: PropertyKey.time) as? Int else {
            os_log("Unable to decode the time for a Product object.", log: OSLog.default, type: .debug)
            return nil
        }

        let daily = aDecoder.decodeObject(forKey: PropertyKey.daily)

        let days = aDecoder.decodeObject(forKey:PropertyKey.days)
        
        // Must call designated initializer.
        self.init(name: name, time: time, daily: (daily != nil), days: days as! [Bool])
        
    }
}
