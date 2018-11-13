//
//  OSConfiguration.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation

/**
 OSConfiguration is responsible for the SDK settings,
 like the IP address in order to establish the connection between
 the Android device and the computer running Live.
 
 Since: 0.1
 */
public class OSConfiguration: NSObject {
    
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
     */
    @objc(setComputerIP:)
    public func setComputerIP(ip: String) -> OSResult {
        return messageManager.initSender(ip: ip)
    }
    
}
