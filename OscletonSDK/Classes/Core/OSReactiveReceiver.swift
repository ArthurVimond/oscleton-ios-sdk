//
//  OSReactiveReceiver.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 10/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation

public class OSReactiveReceiver {
    
    private let liveSetDataManager: OSLiveSetDataManager
    
    init(liveSetDataManager: OSLiveSetDataManager) {
        self.liveSetDataManager = liveSetDataManager
    }
    
    public func test() {
        print("test()")
    }
    
}
