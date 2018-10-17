//
//  OSConfiguration.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation

public class OSConfiguration {
    
    private let liveSetDataManager: LiveSetDataManager
    private let messageManager: MessageManager
    
    init(liveSetDataManager: LiveSetDataManager, messageManager: MessageManager) {
        self.liveSetDataManager = liveSetDataManager
        self.messageManager = messageManager
    }
    
    public func setComputerIP(ip: String) -> OSResult {
        return messageManager.initSender(ip: ip)
    }
    
}
