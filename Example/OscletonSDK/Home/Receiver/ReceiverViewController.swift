//
//  ReceiverViewController.swift
//  OscletonSDK_Example
//
//  Created by Arthur Vimond on 19/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Foundation
import OscletonSDK
import RxSwift

class ReceiverViewController : UIViewController {
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Observe tempo
        OscletonSDK.instance.receiver.rx.tempo
            .subscribe(onNext: { tempo in
                print("tempo.onNext: \(tempo)")
            })
            .disposed(by: bag)
        
        // Observe device param
        OscletonSDK.instance.receiver.rx.deviceParameter
            .subscribe(onNext: { deviceParameter in
                print("ViewController - deviceParameter.onNext - name: \(deviceParameter.paramName) - displayValue: \(deviceParameter.displayValue)")
            })
            .disposed(by: bag)
        
    }
    
}
