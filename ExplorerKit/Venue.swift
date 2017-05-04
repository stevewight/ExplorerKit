//
//  Venue.swift
//  Trvl
//
//  Created by Steve on 4/28/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

class Venue: NSObject {

    var id:String = ""
    var name:String = ""
    var url:String = ""
    var isVerified:Bool = false
    var categories = [VenueCategory]()
    var location = VenueLocation()
    
    init?(json:[String:AnyObject]) {
        super.init()
        
        if let newID = json["id"] as? String {
            id = newID
        }
        
        if let newName = json["name"] as? String {
            name = newName
        }
        
        if let newURL = json["url"] as? String {
            url = newURL
        }
        
        if let newIsVerified = json["isVerified"] as? Bool {
            isVerified = newIsVerified
        }
        
        if let newLocation = json["location"] as? [String:AnyObject] {
            location = VenueLocation(json: newLocation)!
        }
        
        if let newCategories = json["categories"] as? [AnyObject] {
            for newCategory in newCategories {
                let catDictionary = newCategory as! [String : AnyObject]
                let category = VenueCategory(json: catDictionary)!
                categories.append(category)
            }
        }
    }
    
}
