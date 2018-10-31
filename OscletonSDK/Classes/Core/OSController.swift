//
//  OSController.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation

/**
 OSController contains the methods to control the current Live set.
 
 Since: 0.1
 */
public class OSController: NSObject {
    
    private let messageManager: MessageManager
    
    init(messageManager: MessageManager) {
        self.messageManager = messageManager
    }
    
    @objc
    public func play() {
        messageManager.sendMessage(LiveAPI.play)
    }
    
    @objc
    public func stop() {
        messageManager.sendMessage(LiveAPI.stop)
    }
    
}
