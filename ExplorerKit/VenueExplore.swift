//
//  VenueExplore.swift
//  Trvl
//
//  Created by Steve on 4/29/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

protocol VenueExploreDelegate {
    func venueExploreComplete(venues:[Venue])
}

class VenueExplore: APIBase {
    
    var delegate:VenueExploreDelegate!
    
    public func explore() {
        beginTask()
    }
    
    internal override func handleJSON(_ json: [String : AnyObject]) {
        let rawGroups = json["response"]?["groups"] as! [AnyObject]
        let rawItems = rawGroups.first as! [String:AnyObject]
        let itemsArray = rawItems["items"] as! [AnyObject]
        self.createVenues(rawVenues: itemsArray)
        self.delegate.venueExploreComplete(venues:venues)
    }
    
    private func createVenues(rawVenues:[AnyObject]) {
        venues = VenueFactory.explore(raw: rawVenues)
    }
    
    internal override func apiEndpoint()-> String {
        return "\(baseURLString)explore"
    }
    
    internal override func urlFromComponents() -> URL {
        return url(items: [
            URLQueryItem(name: "ll", value: location!)
        ])
    }
}
