//
//  VenueFactory.swift
//  Trvl
//
//  Created by Steve on 5/3/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

class VenueFactory: NSObject {
    
    enum EndpointType {
        case explore
        case search
    }

    class public func explore(raw:[AnyObject])-> [Venue] {
        return build(raw: raw, type: .explore)
    }
    
    class public func search(raw:[AnyObject])-> [Venue] {
        return build(raw: raw, type: .search)
    }
    
    class private func build(raw:[AnyObject],type:EndpointType)->[Venue] {
        var venues = [Venue]()
        for rawVenue in raw {
            let rawDict = rawVenue as! [String:AnyObject]
            let newVenue = Venue(
                json: dict(type: type, raw: rawDict)
            )
            venues.append(newVenue!)
        }
        return venues
    }
    
    class private func dict(type:EndpointType,raw:[String:AnyObject])->[String:AnyObject] {
        var dict = raw
        if type == .explore {
            dict = raw["venue"] as! [String : AnyObject]
        }
        return dict
    }
    
}
