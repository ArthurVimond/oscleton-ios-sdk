//
//  OSConfiguration.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation
import RxSwift

/**
 OSConfiguration is responsible for the SDK settings,
 like the IP address in order to establish the connection between
 the Android device and the computer running Live.
 
 - Since: 0.1
 */
public class OSConfiguration: NSObject {
    
    // Private properties
    
    private let compositeDisposable = CompositeDisposable()
    private var connectionSuccesDisp: Disposable?
    
    // Public properties
    
    /**
     Oscleton SDK version
     
     - Returns: the Oscleton SDK version
     - Since: 0.1
     */
    public var sdkVersion: String {
        get {
            let bundle = Bundle(identifier: "org.cocoapods.OscletonSDK")!
            return bundle.infoDictionary!["CFBundleShortVersionString"] as! String }
    }
    
    /**
     Live software version
     
     - Returns: the Live software version
     - Since: 0.1
     */
    public var liveVersion: Observable<String> {
        get { return liveSetDataManager.liveVersion }
    }
    
    /**
     Oscleton MIDI Remote Script version in Live
     
     - Returns: the Oscleton MIDI Remote Script version
     - Since: 0.1
     */
    public var scriptVersion: Observable<String> {
        get { return liveSetDataManager.scriptVersion }
    }
    
    /**
     Connection success message in response of `setComputerIP:` call.
     
     @return Connection success message
     @since 0.2
     @see setComputerIP
     */
    public var onConnectionSuccess: Observable<Bool> {
        get { return liveSetDataManager.onSetPeerSuccess }
    }
    
    // Private properties
    
    private let liveSetDataManager: LiveSetDataManager
    private let messageManager: MessageManager
    
    init(liveSetDataManager: LiveSetDataManager, messageManager: MessageManager) {
        self.liveSetDataManager = liveSetDataManager
        self.messageManager = messageManager
    }
    
    /**
     Set the computer IP address in order to send actions.
     
     NB: The default port is 9000.
     
     - Parameter ip: the IP address of the computer running Ableton Live
     - Returns: the SDK result
     - Since: 0.1
     */
    @objc(setComputerIP:)
    public func setComputerIP(ip: String) -> OSResult {
        return messageManager.initSender(ip: ip)
    }
    
    /**
     Register a callback to be invoked when the mobile device
     is connected to the computer running Ableton Live.
     
     - Parameter onSuccess: The callback that will run
     - Since: 0.2
     */
    @objc(setOnConnectionSuccessCallback:)
    public func setOnConnectionSuccessCallback(onSuccess: @escaping () -> Void) {
        connectionSuccesDisp = liveSetDataManager.deviceParameter
            .subscribe(onNext: { _ in
                onSuccess()
            })
        _ = compositeDisposable.insert(connectionSuccesDisp!)
    }
    
    /**
     Remove the connection success callback.
     
     - Since: 0.2
     */
    @objc
    public func removeOnConnectionSuccessCallback() {
        connectionSuccesDisp?.dispose()
    }
    
}
