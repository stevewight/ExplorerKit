//
//  VenueSearch.swift
//  Trvl
//
//  Created by Steve on 4/27/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

protocol VenueSearchDelegate {
    func venueSearchComplete(venues:[Venue])
}

class VenueSearch: APIBase {

    var searchQuery = ""
    var delegate:VenueSearchDelegate!
    
    public override init() {super.init()}
    
    public func search(_ query:String) {
        searchQuery = query
        beginTask()
    }
    
    internal override func handleJSON(_ json: [String : AnyObject]) {
        let rawVenues = json["response"]?["venues"] as! [AnyObject]
        self.createVenues(rawVenues: rawVenues)
        self.delegate.venueSearchComplete(venues:venues)
    }
    
    private func createVenues(rawVenues:[AnyObject]) {
        venues = VenueFactory.search(raw: rawVenues)
    }
    
    internal override func apiEndpoint()-> String {
        return "\(baseURLString)search"
    }
    
    internal override func urlFromComponents()->URL {
        return url(items: [
            URLQueryItem(name: "ll", value: location!),
            URLQueryItem(name: "query", value: searchQuery)
        ])
    }
    
}
