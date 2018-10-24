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
import RxCocoa

class ReceiverViewController : UIViewController {
    
    // UI
    @IBOutlet weak var trackNameValueLabel: UILabel!
    @IBOutlet weak var deviceNameValueLabel: UILabel!
    @IBOutlet weak var parameterNameValueLabel: UILabel!
    @IBOutlet weak var displayValueValueLabel: UILabel!
    @IBOutlet weak var valueValueLabel: UILabel!
    @IBOutlet weak var minValueLabel: UILabel!
    @IBOutlet weak var maxValueLabel: UILabel!
    
    private let bag = DisposeBag()
    
    private let viewModel = ReceiverViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearDesignTimeTexts()
        bindProperties()
    }
    
    private func clearDesignTimeTexts() {
        trackNameValueLabel.text = ""
        deviceNameValueLabel.text = ""
        parameterNameValueLabel.text = ""
        displayValueValueLabel.text = ""
        valueValueLabel.text = ""
        minValueLabel.text = ""
        maxValueLabel.text = ""
    }
    
    private func bindProperties() {
        
        // Track name
        viewModel.trackName
            .bind(to: trackNameValueLabel.rx.text)
            .disposed(by: bag)
        
        // Device name
        viewModel.deviceName
            .bind(to: deviceNameValueLabel.rx.text)
            .disposed(by: bag)
        
        // Parameter name
        viewModel.paramName
            .bind(to: parameterNameValueLabel.rx.text)
            .disposed(by: bag)
        
        // Display value
        viewModel.displayValue
            .bind(to: displayValueValueLabel.rx.text)
            .disposed(by: bag)
        
        // Value
        viewModel.value
            .bind(to: valueValueLabel.rx.text)
            .disposed(by: bag)
        
        // Min
        viewModel.min
            .bind(to: minValueLabel.rx.text)
            .disposed(by: bag)
        
        // Max
        viewModel.max
            .bind(to: maxValueLabel.rx.text)
            .disposed(by: bag)
        
    }
    
}
