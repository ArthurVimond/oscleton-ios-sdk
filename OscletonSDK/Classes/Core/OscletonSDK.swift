//
//  OscletonSDK.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 09/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation

public class OscletonSDK {
    
    public static let instance = OscletonSDK()
    
    private let dependencyProvider = DependencyProvider()
    
    public private(set) var receiver: OSReceiver
    
    private init() {
        print("OscletonSDK::init")
        receiver = dependencyProvider.provideReceiver()
    }
    
    public func initialize() {
        
    }
    
}
