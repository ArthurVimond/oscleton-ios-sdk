//
//  OSMessageManager.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//

import Foundation

public class OSMessageManager {
    
    public private(set) var oscManager: OSOSCManager
    
    init(oscManager: OSOSCManager) {
        self.oscManager = oscManager
    }
    
}
