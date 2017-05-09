//
//  VenueHours.swift
//  ExplorerKit
//
//  Created by Steve on 5/9/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

public class VenueHours: NSObject {

    public var isOpen:Bool = false
    public var status:String = ""
    public var isLocalHoliday:Bool = false
    
    override public init() { super.init() }
    
    init?(json:[String:AnyObject]) {
        super.init()
        
        if let newIsOpen = json["isOpen"] as? Bool {
            isOpen = newIsOpen
        }
        
        if let newStatus = json["status"] as? String {
            status = newStatus
        }
        
        if let newIsLocalHoliday = json["isLocalHoliday"] as? Bool {
            isLocalHoliday = newIsLocalHoliday
        }
        
    }
    
}
