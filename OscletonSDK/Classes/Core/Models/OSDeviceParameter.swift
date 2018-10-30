//
//  OSDeviceParameter.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 17/10/2018.
//

import Foundation

public class OSDeviceParameter: NSObject {
    
    @objc public var trackIndex: Int
    @objc public var deviceIndex: Int
    @objc public var paramIndex: Int
    @objc public var trackName: String
    @objc public var deviceName: String
    @objc public var paramName: String
    @objc public var displayValue: String
    @objc public var value: Float
    @objc public var min: Float
    @objc public var max: Float
    
    init(trackIndex: Int,
         deviceIndex: Int,
         paramIndex: Int,
         trackName: String = "",
         deviceName: String = "",
         paramName: String = "",
         displayValue: String = "",
         value: Float = 0,
         min: Float = 0,
         max: Float = 1) {
        self.trackIndex = trackIndex
        self.deviceIndex = deviceIndex
        self.paramIndex = paramIndex
        self.trackName = trackName
        self.deviceName = deviceName
        self.paramName = paramName
        self.displayValue = displayValue
        self.value = value
        self.min = min
        self.max = max
    }
}
