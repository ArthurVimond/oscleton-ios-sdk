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
    @IBOutlet weak var liveVersionValueLabel: UILabel!
    @IBOutlet weak var scriptVersionValueLabel: UILabel!
    @IBOutlet weak var sdkVersionValueLabel: UILabel!
    
    private let viewModel = ConfigurationViewModel()
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ipAddressTextField.delegate = self
        clearDesignTimeTexts()
        bindProperties()
    }
    
    private func clearDesignTimeTexts() {
        liveVersionValueLabel.text = ""
    }
    
    private func bindProperties() {
        
        // IP address
        setIPAddressButton.rx.tap
            .withLatestFrom(ipAddressTextField.rx.text)
            .filter { $0 != nil }
            .map { $0! }
            .bind(to: viewModel.ipAddress)
            .disposed(by: bag)
        
        // Live version
        viewModel.liveVersion
            .bind(to: liveVersionValueLabel.rx.text)
            .disposed(by: bag)
        
        // Script version
        viewModel.scriptVersion
            .bind(to: scriptVersionValueLabel.rx.text)
            .disposed(by: bag)
        
        // SDK version
        sdkVersionValueLabel.text = viewModel.sdkVersion
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
