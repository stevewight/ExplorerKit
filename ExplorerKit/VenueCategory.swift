//
//  VenueCategory.swift
//  Trvl
//
//  Created by Steve on 4/28/17.
//  Copyright © 2017 Steve Wight. All rights reserved.
//

import UIKit

class VenueCategory: NSObject {

    var id:String = ""
    var name:String = ""
    var pluralName:String = ""
    var shortName:String = ""
    var icon = [String:String]()
    var isPrimary:Bool = false
    
    init?(json:[String:AnyObject]) {
        super.init()
        
        if let newID = json["id"] as? String {
            id = newID
        }
        
        if let newName = json["name"] as? String {
            name = newName
        }
        
        if let newPluralName = json["pluralName"] as? String {
            pluralName = newPluralName
        }
        
        if let newShortName = json["shortName"] as? String {
            shortName = newShortName
        }
        
        if let newPrimary = json["primary"] as? Bool {
            isPrimary = newPrimary
        }
        
        if let newIcon = json["icon"] as? [String:String] {
            icon = newIcon
        }
    }
    
    public func xSmallIcon()-> String {
        return baseIcon(size: 32)
    }
    
    public func smallIcon()-> String {
        return baseIcon(size: 44)
    }
    
    public func mediumIcon()-> String {
        return baseIcon(size: 64)
    }
    
    public func largeIcon()-> String {
        return baseIcon(size: 88)
    }
    
    private func baseIcon(size:Int)->String {
        return "\(icon["prefix"]!)\(size)\(icon["suffix"]!)"
    }
    
}
