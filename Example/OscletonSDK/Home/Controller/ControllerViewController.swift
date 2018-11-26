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
        
    }
    
}
