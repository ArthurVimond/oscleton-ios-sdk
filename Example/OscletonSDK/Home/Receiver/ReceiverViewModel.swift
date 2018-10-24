//
//  ReceiverViewModel.swift
//  OscletonSDK_Example
//
//  Created by Arthur Vimond on 24/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift
import OscletonSDK

class ReceiverViewModel {
    
    // UI
    
    var trackName: Observable<String> {
        return OscletonSDK.instance.receiver.rx.deviceParameter.map { $0.trackName }
    }
    
    var deviceName: Observable<String> {
        return OscletonSDK.instance.receiver.rx.deviceParameter.map { $0.deviceName }
    }
    
    var paramName: Observable<String> {
        return OscletonSDK.instance.receiver.rx.deviceParameter.map { $0.paramName }
    }
    
    var displayValue: Observable<String> {
        return OscletonSDK.instance.receiver.rx.deviceParameter.map { $0.displayValue }
    }
    
    var value: Observable<String> {
        return OscletonSDK.instance.receiver.rx.deviceParameter.map { "\($0.value)" }
    }
    
    var min: Observable<String> {
        return OscletonSDK.instance.receiver.rx.deviceParameter.map { "\($0.min)" }
    }
    
    var max: Observable<String> {
        return OscletonSDK.instance.receiver.rx.deviceParameter.map { "\($0.max)" }
    }
    
    
    
}
