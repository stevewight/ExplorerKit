//
//  EKClient.swift
//  Trvl
//
//  Created by Steve on 5/3/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

public protocol EKClientDelegate {
    func clientExploreComplete()
    func clientSearchComplete()
}

public class EKClient: NSObject, VenueSearchDelegate, VenueExploreDelegate {

    public var clientID:String!
    public var clientSecret:String!
    public var version:String!
    public var location:String!
    public var venues = [Venue]()
    public var delegate:EKClientDelegate!
    
    override public init() { super.init() }
    
    public init(clientID:String,clientSecret:String,version:String) {
        super.init()
        self.clientID = clientID
        self.clientSecret = clientSecret
        self.version = version
    }
    
    public func setLocation(lat:Double,lng:Double) {
        location = "\(lat),\(lng)"
    }
    
    public func explore() {
        let venueExplore = VenueExplore()
        venueExplore.delegate = self
        venueExplore.location = location
        setCredentials(apiEndpoint:venueExplore)
        venueExplore.explore()
    }
    
    public func search(_ query:String) {
        let venueSearch = VenueSearch()
        venueSearch.delegate = self
        venueSearch.location = location
        setCredentials(apiEndpoint:venueSearch)
        venueSearch.search(query)
    }
    
    private func setCredentials(apiEndpoint:APIBase) {
        apiEndpoint.clientID = clientID
        apiEndpoint.clientSecret = clientSecret
        apiEndpoint.version = version
    }
    
    // MARK: VenueSearchDelegate Methods
    
    func venueSearchComplete(venues:[Venue]) {
        self.venues = venues
        delegate.clientSearchComplete()
    }
    
    // MARK: VenueExploreDelegate Methods
    
    func venueExploreComplete(venues:[Venue]) {
        self.venues = venues
        delegate.clientExploreComplete()
    }
    
}
