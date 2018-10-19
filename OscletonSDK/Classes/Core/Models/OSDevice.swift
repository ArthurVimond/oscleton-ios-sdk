//
//  OSDevice.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 17/10/2018.
//

import Foundation

public struct OSDevice {
    
    public var trackIndex: Int
    public var deviceIndex: Int
    public var deviceName: String
    
    init(trackIndex: Int,
         deviceIndex: Int,
         deviceName: String = "") {
        self.trackIndex = trackIndex
        self.deviceIndex = deviceIndex
        self.deviceName = deviceName
    }
}
