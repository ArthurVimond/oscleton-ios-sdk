//
//  OSController.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation

public class OSController {
    
    private let messageManager: OSMessageManager
    
    init(messageManager: OSMessageManager) {
        self.messageManager = messageManager
    }
    
    public func play() {
        messageManager.sendMessage(address: OSLiveAPI.play)
    }
    
    public func stop() {
        messageManager.sendMessage(address: OSLiveAPI.stop)
    }
    
}
