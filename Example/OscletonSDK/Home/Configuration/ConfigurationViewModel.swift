//
//  ConfigurationViewModel.swift
//  OscletonSDK_Example
//
//  Created by Arthur Vimond on 24/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift
import OscletonSDK

class ConfigurationViewModel {
    
    let ipAddress: BehaviorSubject<String> = BehaviorSubject(value: "")
    
    var liveVersion: Observable<String> {
        return OscletonSDK.instance.config.liveVersion
    }
    
    var scriptVersion: Observable<String> {
        return OscletonSDK.instance.config.scriptVersion
    }
    
    var sdkVersion: String {
        return OscletonSDK.instance.config.sdkVersion
    }
    
    private let bag = DisposeBag()
    
    init() {
        observeProperties()
    }
    
    private func observeProperties() {
        
        // IP address
        ipAddress
            .filter { !$0.isEmpty }
            .subscribe(onNext: { ip in
                let result = OscletonSDK.instance.config.setComputerIP(ip: ip)
                if result == .error {
                    print("Unable to setComputerIP()")
                }
            })
            .disposed(by: bag)
        
        // On connection success
        OscletonSDK.instance.config.onConnectionSuccess
            .subscribe(onNext: { _ in
                print("onConnectionSuccess")
            })
            .disposed(by: bag)
        
    }
    
}
