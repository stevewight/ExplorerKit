//
//  VenueLocation.swift
//  Trvl
//
//  Created by Steve on 4/28/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

class VenueLocation: NSObject {
    
    let METERS_HOUR_WALKING = 5000

    var state:String = ""
    var city:String = ""
    var postalCode:String = ""
    var country:String = ""
    var countryCode = ""
    var lat:Double = 0.0
    var lng:Double = 0.0
    var distance:Int = 0
    
    override init() { super.init() }
    
    init?(json:[String:AnyObject]) {
        super.init()
        
        if let newState = json["state"] as? String {
            state = newState
        }
        
        if let newCity = json["city"] as? String {
            city = newCity
        }
        
        if let newPostalCode = json["postalCode"] as? String {
            postalCode = newPostalCode
        }
        
        if let newCountry = json["country"] as? String {
            country = newCountry
        }
        
        if let newCountryCode = json["cc"] as? String {
            countryCode = newCountryCode
        }
        
        if let newLat = json["lat"] as? Double {
            lat = newLat
        }
        
        if let newLng = json["lng"] as? Double {
            lng = newLng
        }
        
        if let newDistance = json["distance"] as? Int {
            distance = newDistance
        }
    }
    
    // In minutes
    public func walkTime()-> Int {
        let raw = Double(distance)/Double(METERS_HOUR_WALKING)
        let minutes = raw * 60
        return Int(minutes)
    }
    
}
