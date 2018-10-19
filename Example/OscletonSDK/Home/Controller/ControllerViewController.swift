//
//  ControllerViewController.swift
//  OscletonSDK_Example
//
//  Created by Arthur Vimond on 19/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Foundation
import OscletonSDK
import RxSwift

class ControllerViewController : UIViewController {
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OscletonSDK.instance.controller.play()
        
    }
    
}
