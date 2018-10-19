//
//  OSDeviceParameterIndices.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 19/10/2018.
//

import Foundation

struct OSDeviceParameterIndices : Hashable {
    
    var trackIndex: Int
    var deviceIndex: Int
    var paramIndex: Int
    
    init(trackIndex: Int,
         deviceIndex: Int,
         paramIndex: Int) {
        self.trackIndex = trackIndex
        self.deviceIndex = deviceIndex
        self.paramIndex = paramIndex
    }
}
