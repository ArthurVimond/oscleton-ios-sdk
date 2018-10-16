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
    
    public private(set) var configuration: OSConfiguration
    public private(set) var controller: OSController
    public private(set) var receiver: OSReceiver
    
    private let messageManager: MessageManager
    
    private init() {
        print("OscletonSDK::init")
        configuration = dependencyProvider.provideConfiguration()
        controller = dependencyProvider.provideController()
        receiver = dependencyProvider.provideReceiver()
        messageManager = dependencyProvider.provideMessageManager()
    }
    
    public func initialize() {
        
    }
    
    public func connect() {
        messageManager.connect()
    }
    
    public func disconnect() {
        messageManager.disconnect()
    }
    
    public func startListening() {
        messageManager.startListening()
    }
    
    public func stopListening() {
        messageManager.stopListening()
    }
    
    // Lifecycle
    
    public func applicationDidBecomeActive() {
        connect()
        startListening()
    }
    
    public func applicationWillResignActive() {
        stopListening()
        disconnect()
    }
    
}
