//
//  OscletonSDK.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 09/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation

// Documentation Generation:
// cd Example/Pods
// sourcedocs generate --clean --output-folder ../../OscletonSDK/Doc/ios-reference -- -scheme OscletonSDK


/**
 The main entry point to use Oscleton SDK.
 
 This singleton provides multiple features splitted in different classes:
 - OSConfiguration is responsible for the settings needed to establish the connection.
 - OSController lets you control a Live set from your iOS device.
 - OSReceiver lets you receive Live set events in real time on your iOS device.
 
 Since: 0.1
 */
public class OscletonSDK: NSObject {
    
    @objc public static let instance = OscletonSDK()
    
    /// OSConfiguration is responsible for the settings needed to establish the connection.
    @objc public private(set) var configuration: OSConfiguration
    
    /// OSController lets you control a Live set from your iOS device.
    @objc public private(set) var controller: OSController
    
    /// OSReceiver lets you receive Live set events in real time on your iOS device.
    @objc public private(set) var receiver: OSReceiver
    
    // Private properties
    private let dependencyProvider = DependencyProvider()
    private let messageManager: MessageManager
    
    private override init() {
        print("OscletonSDK::init")
        configuration = dependencyProvider.provideConfiguration()
        controller = dependencyProvider.provideController()
        receiver = dependencyProvider.provideReceiver()
        messageManager = dependencyProvider.provideMessageManager()
    }
    
    @objc public func initialize() {
        
    }
    
    @objc public func connect() {
        messageManager.connect()
    }
    
    @objc public func disconnect() {
        messageManager.disconnect()
    }
    
    @objc public func startListening() {
        messageManager.startListening()
    }
    
    @objc public func stopListening() {
        messageManager.stopListening()
    }
    
    // Lifecycle
    
    @objc public func applicationDidBecomeActive() {
        connect()
        startListening()
    }
    
    @objc public func applicationWillResignActive() {
        stopListening()
        disconnect()
    }
    
}
