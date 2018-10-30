//
//  OSReactiveReceiver.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 10/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation
import RxSwift

public class OSReactiveReceiver: NSObject {
    
    public var tempo: Observable<Float> {
        get { return liveSetDataManager.tempo }
    }
    
    public var deviceParameter: Observable<OSDeviceParameter> {
        get { return liveSetDataManager.deviceParameter }
    }
    
    // Private properties
    
    private let liveSetDataManager: LiveSetDataManager
    
    init(liveSetDataManager: LiveSetDataManager) {
        self.liveSetDataManager = liveSetDataManager
    }
    
}
