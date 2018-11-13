//
//  OSDeviceIndices.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 19/10/2018.
//

import Foundation

/**
 Data class representing a Live device indices info.
 
 - Since: 0.1
 */
struct OSDeviceIndices : Hashable {
    
    /// The track position in the Live set
    var trackIndex: Int
    
    /// The device position in the track
    var deviceIndex: Int
    
    init(trackIndex: Int,
         deviceIndex: Int) {
        self.trackIndex = trackIndex
        self.deviceIndex = deviceIndex
    }
}
