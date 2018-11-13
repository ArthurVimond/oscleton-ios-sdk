//
//  OSDeviceParameterIndices.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 19/10/2018.
//

import Foundation

/**
 Data class representing a Live device parameter indices info.
 
 - Since: 0.1
 */
struct OSDeviceParameterIndices : Hashable {
    
    /// The track position in the Live set
    var trackIndex: Int
    
    /// The device position in the track
    var deviceIndex: Int
    
    /// The parameter position on the device
    var paramIndex: Int
    
    init(trackIndex: Int,
         deviceIndex: Int,
         paramIndex: Int) {
        self.trackIndex = trackIndex
        self.deviceIndex = deviceIndex
        self.paramIndex = paramIndex
    }
}
