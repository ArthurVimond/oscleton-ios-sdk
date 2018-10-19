//
//  HomeTableViewCell.swift
//  OscletonSDK_Example
//
//  Created by Arthur Vimond on 19/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Foundation

class HomeTableViewCell : UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func bind(viewModel: HomeViewModel, indexPath: IndexPath) {
        titleLabel.text = viewModel.titleForRow(at: indexPath)
    }
    
}
