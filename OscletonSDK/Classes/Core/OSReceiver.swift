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
 
 - Since: 0.1
 */
public class OSReceiver: NSObject {
    
    /// The OSReactiveReceiver containing RxSwift Observables. Only available for Swift.
    public private(set) var rx: OSReactiveReceiver
    
    /// The OSCallbackReceiver containing callbacks. Both available for Swift and Objective-C.
    @objc
    public private(set) var cb: OSCallbackReceiver
    
    init(rx: OSReactiveReceiver, cb: OSCallbackReceiver) {
        self.rx = rx
        self.cb = cb
    }
    
}
