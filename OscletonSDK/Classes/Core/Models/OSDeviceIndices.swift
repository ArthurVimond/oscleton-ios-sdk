//
//  OSDeviceIndices.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 19/10/2018.
//

import Foundation

struct OSDeviceIndices : Hashable {
    
    var trackIndex: Int
    var deviceIndex: Int
    
    init(trackIndex: Int,
         deviceIndex: Int) {
        self.trackIndex = trackIndex
        self.deviceIndex = deviceIndex
    }
}
