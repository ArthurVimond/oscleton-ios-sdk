//
//  ControllerViewModel.swift
//  OscletonSDK_Example
//
//  Created by Arthur Vimond on 24/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import OscletonSDK

class ControllerViewModel {
    
    func play() {
        OscletonSDK.instance.controller.play()
    }
    
    func stop() {
        OscletonSDK.instance.controller.stop()
    }
    
}
