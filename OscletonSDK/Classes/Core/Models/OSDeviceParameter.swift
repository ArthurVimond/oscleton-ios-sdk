//
//  OSDeviceParameter.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 17/10/2018.
//

import Foundation

public struct OSDeviceParameter {
    
    public var trackIndex: Int
    public var deviceIndex: Int
    public var paramIndex: Int
    public var trackName: String
    public var deviceName: String
    public var paramName: String
    public var displayValue: String
    public var value: Float
    public var min: Float
    public var max: Float
    
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
