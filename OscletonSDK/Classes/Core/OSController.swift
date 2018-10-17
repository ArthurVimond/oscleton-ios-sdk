//
//  OSController.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation

public class OSController {
    
    private let messageManager: MessageManager
    
    init(messageManager: MessageManager) {
        self.messageManager = messageManager
    }
    
    public func play() {
        messageManager.sendMessage(LiveAPI.play)
    }
    
    public func stop() {
        messageManager.sendMessage(LiveAPI.stop)
    }
    
}
