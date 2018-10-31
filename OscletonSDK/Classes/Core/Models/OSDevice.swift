//
//  OSDevice.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 17/10/2018.
//

import Foundation

public class OSDevice: NSObject {
    
    @objc
    public var trackIndex: Int
    
    @objc
    public var deviceIndex: Int
    
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
