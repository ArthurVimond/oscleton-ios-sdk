//
//  OSLiveSetDataManager.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation

public class OSLiveSetDataManager {
    
    public private(set) var messageManager: OSMessageManager
    
    init(messageManager: OSMessageManager) {
        self.messageManager = messageManager
    }
    
}
