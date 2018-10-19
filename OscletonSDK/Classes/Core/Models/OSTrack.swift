//
//  OSTrack.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 18/10/2018.
//

import Foundation

public struct OSTrack {
    
    public var index: Int
    public var name: String
    public var type: OSTrackType
    public var volume: Float
    public var pan: Float
    public var arm: Int
    public var mute: Int
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
