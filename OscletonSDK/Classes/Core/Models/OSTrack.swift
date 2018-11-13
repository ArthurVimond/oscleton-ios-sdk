//
//  OSTrack.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 18/10/2018.
//

import Foundation

/**
 Data class representing a Live track.
 
 - Since: 0.1
 */
public class OSTrack: NSObject {
    
    /// The track position in the Live set
    @objc
    public var index: Int
    
    /// The track name
    @objc
    public var name: String
    
    /// The track type
    @objc
    public var type: OSTrackType
    
    /// The track volume
    @objc
    public var volume: Float
    
    /// The track panning
    @objc
    public var pan: Float
    
    /// The track arm state
    @objc
    public var arm: Int
    
    /// The track mute state
    @objc
    public var mute: Int
    
    /// The track solo state
    @objc
    public var solo: Int
    
    init(index: Int,
         name: String = "",
         type: OSTrackType = .audio,
         volume: Float = 0.85,
         pan: Float = 0,
         arm: Int = 0,
         mute: Int = 0,
         solo: Int = 0) {
        self.index = index
        self.name = name
        self.type = type
        self.volume = volume
        self.pan = pan
        self.arm = arm
        self.mute = mute
        self.solo = solo
    }
}
