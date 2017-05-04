//
//  APIBase.swift
//  Trvl
//
//  Created by Steve on 4/29/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

class APIBase: NSObject {

    var clientID:String!
    var clientSecret:String!
    var version:String!
    var venues = [Venue]()
    let baseURLString = "https://api.foursquare.com/v2/venues/"
    let session = URLSession(
        configuration: URLSessionConfiguration.default
    )
    var location:String!
    
    internal func beginTask() {
        let request = URLRequest(url: urlFromComponents())
        let task = session.dataTask(with: request) {data,response,error in
            self.handleDataResponse(data: data!)
        }
        task.resume()
    }
    
    internal func handleDataResponse(data:Data) {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject] {
                handleJSON(json)
            }
        } catch { print("error...") }

    }
    
    internal func url(items:[URLQueryItem])->URL {
        let urlComponents = NSURLComponents(string: apiEndpoint())!
        var baseItems = baseURLComponents()
        baseItems += items
        urlComponents.queryItems = baseItems
        return urlComponents.url!
    }
    
    internal func baseURLComponents()-> [URLQueryItem] {
        return [
            URLQueryItem(name: "client_id", value: clientID),
            URLQueryItem(name: "client_secret", value: clientSecret),
            URLQueryItem(name: "v", value: version)
        ]
    }
    
    internal func apiEndpoint()-> String {
        preconditionFailure("Must be overridden")
    }
    
    internal func urlFromComponents()->URL {
        preconditionFailure("Must be overridden")
    }
    
    internal func handleJSON(_ json:[String:AnyObject]) {
        preconditionFailure("Must be overridden")
    }
    
}
