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
// sourcedocs generate --clean --output-folder ../../OscletonSDK/Doc/reference/ios -- -scheme OscletonSDK


/**
 The main entry point to use Oscleton SDK.
 
 This singleton provides multiple features splitted in different classes:
 - [OSConfiguration](../OSConfiguration) is responsible for the settings needed to establish the connection.
 - [OSController](../OSController) lets you control a Live set from your iOS device.
 - [OSReceiver](../OSReceiver) lets you receive Live set events in real time on your iOS device.
 
 Since: 0.1
 */
public class OscletonSDK: NSObject {
    
    /// The singleton instance of Oscleton SDK.
    @objc
    public static let instance = OscletonSDK()
    
    /// OSConfiguration is responsible for the settings needed to establish the connection.
    @objc
    public private(set) var configuration: OSConfiguration
    
    /// OSController lets you control a Live set from your iOS device.
    @objc
    public private(set) var controller: OSController
    
    /// OSReceiver lets you receive Live set events in real time on your iOS device.
    @objc
    public private(set) var receiver: OSReceiver
    
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
    
    /**
     Initialize the SDK.
     
     This method must be called at application launch,
     in the app delegate's `application:didFinishLaunchingWithOptions:` method.
     
     Since: 0.1
     */
    @objc
    public func initialize() {
        
    }
    
    /**
     Connect the device and prepare to listen for incoming changes.
     
     If `applicationDidBecomeActive()` is called in the app delegate,
     this method will be automatically called when the app goes to foreground.
     
     Since: 0.1
     */
    @objc
    public func connect() {
        messageManager.connect()
    }
    
    /**
     Disconnect the device and close the incoming changes listener.
     
     If `applicationWillResignActive()` is called in the app delegate,
     this method will be automatically called when the app goes to background.
     
     Since: 0.1
     */
    @objc
    public func disconnect() {
        messageManager.disconnect()
    }
    
    /**
     Start listening for incoming changes.
     
     If `applicationDidBecomeActive()` is called in the app delegate,
     this method will be automatically called when the app goes to foreground.
     
     Since: 0.1
     */
    @objc
    public func startListening() {
        messageManager.startListening()
    }
    
    /**
     Stop listening for incoming changes.
     
     If `applicationWillResignActive()` is called in the app delegate,
     this method will be automatically called when the app goes to background.
     
     Since: 0.1
     */
    @objc
    public func stopListening() {
        messageManager.stopListening()
    }
    
    // Lifecycle
    
    /**
     Call this function in the app delegate's `applicationDidBecomeActive()`
     to automatically handle device connection state.
     
     Internally, it directly calls `connect()` and `startListening()` methods.
     
     Since: 0.1
     */
    @objc
    public func applicationDidBecomeActive() {
        connect()
        startListening()
    }
    
    /**
     Call this function in the app delegate's `applicationWillResignActive()`
     to automatically handle device connection state.
     
     Internally, it directly calls `disconnect()` and `stopListening()` methods.
     
     Since: 0.1
     */
    @objc
    public func applicationWillResignActive() {
        stopListening()
        disconnect()
    }
    
}
