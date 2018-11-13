//
//  OSDeviceParameter.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 17/10/2018.
//

import Foundation

/**
 Data class representing a Live device parameter.
 
 - Since: 0.1
 */
public class OSDeviceParameter: NSObject {
    
    /// The track position in the Live set
    @objc
    public var trackIndex: Int
    
    /// The device position in the track
    @objc
    public var deviceIndex: Int
    
    /// The parameter position on the device
    @objc
    public var paramIndex: Int
    
    /// The track name containing the device
    @objc
    public var trackName: String
    
    /// The device name containing the parameter
    @objc
    public var deviceName: String
    
    /// The parameter name
    @objc
    public var paramName: String
    
    /// The parameter value as displayed in Live
    @objc
    public var displayValue: String
    
    /// The parameter value
    @objc
    public var value: Float
    
    /// The parameter min value
    @objc
    public var min: Float
    
    /// The parameter max value
    @objc
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
