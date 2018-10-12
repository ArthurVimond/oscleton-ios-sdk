//
//  DependencyProvider.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 10/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation
import Swinject

class DependencyProvider {
    
    private let container = Container()
    
    init() {
        
        container.register(OSReceiver.self) { r in
            OSReceiver(rx: r.resolve(OSReactiveReceiver.self)!)
        }
        
        container.register(OSReactiveReceiver.self) { r in
            OSReactiveReceiver(liveSetDataManager: r.resolve(OSLiveSetDataManager.self)!)
        }
        
        container.register(OSLiveSetDataManager.self) { r in
            OSLiveSetDataManager(messageManager: r.resolve(OSMessageManager.self)!)
        }
        
        container.register(OSMessageManager.self) { r in
            OSMessageManager(oscManager: r.resolve(OSOSCManager.self)!)
        }
        
        container.register(OSOSCManager.self) { _ in OSOSCManager() }
        
    }
    
    func provideReceiver() -> OSReceiver {
        return container.resolve(OSReceiver.self)!
    }
    
    func provideReactiveReceiver() -> OSReactiveReceiver {
        return container.resolve(OSReactiveReceiver.self)!
    }
    
    func provideLiveSetDataManager() -> OSLiveSetDataManager {
        return container.resolve(OSLiveSetDataManager.self)!
    }
    
    func provideMessageManager() -> OSMessageManager {
        return container.resolve(OSMessageManager.self)!
    }
    
    func provideOSCManager() -> OSOSCManager {
        return container.resolve(OSOSCManager.self)!
    }
    
}
