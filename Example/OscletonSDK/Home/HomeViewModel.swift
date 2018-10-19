//
//  HomeViewModel.swift
//  OscletonSDK_Example
//
//  Created by Arthur Vimond on 19/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    private let titles = ["Controller", "Receiver", "Configuration"]
    
    private let segueIdentifiers = ["goToController", "goToReceiver", "goToConfiguration"]
    
    func titleForRow(at indexPath: IndexPath) -> String {
        return titles[indexPath.row]
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return titles.count
    }
    
    func segueIdentifierForRow(at indexPath: IndexPath) -> String {
        return segueIdentifiers[indexPath.row]
    }
    
}
