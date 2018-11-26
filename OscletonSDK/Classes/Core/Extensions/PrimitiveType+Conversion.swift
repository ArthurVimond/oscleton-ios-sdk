//
//  PrimitiveType+Conversion.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 26/11/2018.
//

import Foundation

/**
 Extension function to convert a Bool to Int.
 
 - Since: 0.1
 */
extension Bool {
    
    func int() -> Int {
        return self ? 1 : 0
    }
    
}

/**
 Extension function to convert an Int to Bool.
 
 - Since: 0.1
 */
extension Int {
    
    func bool() -> Bool {
        return self == 1
    }
    
}
