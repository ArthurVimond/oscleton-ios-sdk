//
//  OSDevice.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 17/10/2018.
//

import Foundation

/**
 Data class representing a Live device.
 
 - Since: 0.1
 */
public class OSDevice: NSObject {
    
    /// The track position in the Live set
    @objc
    public var trackIndex: Int
    
    /// The device position in the track
    @objc
    public var deviceIndex: Int
    
    /// The device name
    @objc
    public var deviceName: String
    
    init(trackIndex: Int,
         deviceIndex: Int,
         deviceName: String = "") {
        self.trackIndex = trackIndex
        self.deviceIndex = deviceIndex
        self.deviceName = deviceName
    }
}
