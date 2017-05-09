//
//  VenueStats.swift
//  ExplorerKit
//
//  Created by Steve on 5/10/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

public class VenueStats: NSObject {

    public var checkinsCount:Int = 0
    public var tipCount:Int = 0
    public var userCount:Int = 0
    
    override public init() { super.init() }
    
    init?(json:[String:AnyObject]) {
        super.init()
        
        if let newCheckinsCount = json["checkinsCount"] as? Int {
            checkinsCount = newCheckinsCount
        }
        
        if let newTipCount = json["tipCount"] as? Int {
            tipCount = newTipCount
        }
        
        if let newUserCount = json["tipCount"] as? Int {
            userCount = newUserCount
        }
    }
    
}
