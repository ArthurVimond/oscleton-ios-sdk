//
//  ConfigurationViewController.swift
//  OscletonSDK_Example
//
//  Created by Arthur Vimond on 19/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class ConfigurationViewController : UIViewController, UITextFieldDelegate {
    
    // UI
    @IBOutlet weak var ipAddressTextField: UITextField!
    @IBOutlet weak var setIPAddressButton: UIButton!
    
    private let viewModel = ConfigurationViewModel()
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ipAddressTextField.delegate = self
        observeProperties()
    }
    
    private func observeProperties() {
        
        // IP address
        setIPAddressButton.rx.tap
            .withLatestFrom(ipAddressTextField.rx.text)
            .filter { $0 != nil }
            .map { $0! }
            .bind(to: viewModel.ipAddress)
            .disposed(by: bag)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
