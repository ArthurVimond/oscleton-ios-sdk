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
        
        container.register(OSReactiveReceiver.self) { _ in OSReactiveReceiver() }
        
    }
    
    func provideReceiver() -> OSReceiver {
        return container.resolve(OSReceiver.self)!
    }
    
    func provideReactiveReceiver() -> OSReactiveReceiver {
        return OSReactiveReceiver()
    }
    
}
