//
//  ViewController.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import UIKit
import OscletonSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        
        OscletonSDK.instance.initialize()
        
        OscletonSDK.instance.receiver.rx.test()
        
    }

}

