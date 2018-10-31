//
//  OSTrack.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 18/10/2018.
//

import Foundation

public class OSTrack: NSObject {
    
    @objc
    public var index: Int
    
    @objc
    public var name: String
    
    @objc
    public var type: OSTrackType
    
    @objc
    public var volume: Float
    
    @objc
    public var pan: Float
    
    @objc
    public var arm: Int
    
    @objc
    public var mute: Int
    
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
