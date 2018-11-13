//
//  OSReactiveReceiver.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 10/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation
import RxSwift

/**
 OSReactiveReceiver contains RxSwift Observables reacting to the Live set data changes.
 
 If a reactive approach doesn't fit your needs, consider implementing [OSCallbackReceiver](../OSCallbackReceiver) instead.
 
 - Since: 0.1
 */
public class OSReactiveReceiver: NSObject {
    
    /**
     Returns the Live set global tempo as Observable.
     
     - Returns: the Live set global tempo as Observable
     - Since: 0.1
     */
    public var tempo: Observable<Float> {
        get { return liveSetDataManager.tempo }
    }
    
    /**
     Returns the last changing device parameter as Observable.
     
     - Returns: the last changing device parameter as Observable
     - Since: 0.1
     */
    public var deviceParameter: Observable<OSDeviceParameter> {
        get { return liveSetDataManager.deviceParameter }
    }
    
    // Private properties
    
    private let liveSetDataManager: LiveSetDataManager
    
    init(liveSetDataManager: LiveSetDataManager) {
        self.liveSetDataManager = liveSetDataManager
    }
    
}
