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
import RxCocoa

class ControllerViewController : UIViewController {
    
    // UI
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var redoButton: UIButton!
    @IBOutlet weak var metronomeSwitch: UISwitch!
    @IBOutlet weak var overdubSwitch: UISwitch!
    
    private let viewModel = ControllerViewModel()
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Play
        playButton.rx.tap
            .bind { self.viewModel.play() }
            .disposed(by: bag)
        
        // Stop
        stopButton.rx.tap
            .bind { self.viewModel.stop() }
            .disposed(by: bag)
        
        // Undo
        undoButton.rx.tap
            .bind { self.viewModel.undo() }
            .disposed(by: bag)
        
        // Redo
        redoButton.rx.tap
            .bind { self.viewModel.redo() }
            .disposed(by: bag)
        
        // Metronome
        metronomeSwitch.rx.controlEvent(UIControlEvents.valueChanged)
            .subscribe(onNext: { [unowned self] _ in
                let isOn = self.metronomeSwitch.isOn
                self.viewModel.setMetronome(enabled: isOn)
            })
            .disposed(by: bag)
        
        // Overdub
        overdubSwitch.rx.controlEvent(UIControlEvents.valueChanged)
            .subscribe(onNext: { [unowned self] _ in
                let isOn = self.overdubSwitch.isOn
                self.viewModel.setOverdub(enabled: isOn)
            })
            .disposed(by: bag)
        
    }
    
}
