//
//  ViewController.swift
//  OscletonSample
//
//  Created by Arthur Vimond on 09/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import UIKit
import OscletonSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        OscletonSDK.instance.initialize()
        
    }


}

