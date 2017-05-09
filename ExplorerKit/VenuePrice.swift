//
//  VenuePrice.swift
//  ExplorerKit
//
//  Created by Steve on 5/9/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

public class VenuePrice: NSObject {

    public var currency:String = ""
    public var message:String = ""
    public var tier:Int = 0
    
    override public init() { super.init() }
    
    init?(json:[String:AnyObject]) {
        super.init()
        
        if let newCurrency = json["currency"] as? String {
            currency = newCurrency
        }
        
        if let newMessage = json["message"] as? String {
            message = newMessage
        }
        
        if let newTier = json["tier"] as? Int {
            tier = newTier
        }
    }
    
}
