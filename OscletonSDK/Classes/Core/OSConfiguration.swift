//
//  OSConfiguration.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation

public class OSConfiguration {
    
    private let liveSetDataManager: OSLiveSetDataManager
    private let messageManager: OSMessageManager
    
    init(liveSetDataManager: OSLiveSetDataManager, messageManager: OSMessageManager) {
        self.liveSetDataManager = liveSetDataManager
        self.messageManager = messageManager
    }
    
}
