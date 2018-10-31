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
        
        container.register(OSConfiguration.self) { r in
            let liveSetDataManager = r.resolve(LiveSetDataManager.self)!
            let messageManager = r.resolve(MessageManager.self)!
            return OSConfiguration(liveSetDataManager: liveSetDataManager, messageManager: messageManager)
        }.inObjectScope(.container)
        
        container.register(OSController.self) { r in
            OSController(messageManager: r.resolve(MessageManager.self)!)
        }.inObjectScope(.container)
        
        container.register(OSReceiver.self) { r in
            let reactiveReceiver = r.resolve(OSReactiveReceiver.self)!
            let callbackReceiver = r.resolve(OSCallbackReceiver.self)!
            return OSReceiver(rx: reactiveReceiver, cb: callbackReceiver)
        }.inObjectScope(.container)
        
        container.register(OSReactiveReceiver.self) { r in
            OSReactiveReceiver(liveSetDataManager: r.resolve(LiveSetDataManager.self)!)
        }.inObjectScope(.container)
        
        container.register(OSCallbackReceiver.self) { r in
            OSCallbackReceiver(liveSetDataManager: r.resolve(LiveSetDataManager.self)!)
            }.inObjectScope(.container)
        
        container.register(LiveSetDataManager.self) { r in
            LiveSetDataManager(messageManager: r.resolve(MessageManager.self)!)
        }.inObjectScope(.container)
        
        container.register(MessageManager.self) { r in
            MessageManager(oscManager: r.resolve(OSCManager.self)!)
        }.inObjectScope(.container)
        
        container.register(OSCManager.self) { _ in OSCManager() }
            .inObjectScope(.container)
        
    }
    
    func provideConfiguration() -> OSConfiguration {
        return container.resolve(OSConfiguration.self)!
    }
    
    func provideController() -> OSController {
        return container.resolve(OSController.self)!
    }
    
    func provideReceiver() -> OSReceiver {
        return container.resolve(OSReceiver.self)!
    }
    
    func provideReactiveReceiver() -> OSReactiveReceiver {
        return container.resolve(OSReactiveReceiver.self)!
    }
    
    func provideLiveSetDataManager() -> LiveSetDataManager {
        return container.resolve(LiveSetDataManager.self)!
    }
    
    func provideMessageManager() -> MessageManager {
        return container.resolve(MessageManager.self)!
    }
    
    func provideOSCManager() -> OSCManager {
        return container.resolve(OSCManager.self)!
    }
    
}
