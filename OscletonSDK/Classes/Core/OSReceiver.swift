//
//  OSReceiver.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 10/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation

/**
 OSReceiver is just a container class to access [OSReactiveReceiver](../OSReactiveReceiver) and [OSCallbackReceiver](../OSCallbackReceiver).
 
 Since: 0.1
 */
public class OSReceiver: NSObject {
    
    public private(set) var rx: OSReactiveReceiver
    
    init(rx: OSReactiveReceiver) {
        self.rx = rx
    }
    
}
