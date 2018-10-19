//
//  ConfigurationViewController.swift
//  OscletonSDK_Example
//
//  Created by Arthur Vimond on 19/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Foundation
import OscletonSDK
import RxSwift

class ConfigurationViewController : UIViewController {
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result = OscletonSDK.instance.configuration.setComputerIP(ip: "192.168.4.186")
        if result == .error {
            print("Unable to setComputerIP()")
        }
        
    }
    
}
