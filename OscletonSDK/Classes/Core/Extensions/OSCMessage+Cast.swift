//
//  OSCMessage+Cast.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 17/10/2018.
//

import Foundation
import SwiftOSC

extension OSCType {
    
    func boolean() -> Bool {
        return self as! Bool
    }
    
    func int() -> Int {
        return self as! Int
    }
    
    func float() -> Float {
        return self as! Float
    }
    
    func string() -> String {
        return self as! String
    }
    
}
