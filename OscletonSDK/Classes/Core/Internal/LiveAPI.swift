//
//  LiveAPI.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation

struct LiveAPI {
    
    // Prefix
    private static let live = "/live/"
    
    // Config
    static let liveVersion = live + "config/live_version"
    static let scriptVersion = live + "config/script_version"
    static let setPeer = live + "set_peer"
    static let setPeerSuccess = live + "set_peer/success"
    
    // Transport
    
    static let tempo = live + "tempo"
    
    static let play = live + "play"
    static let stop = live + "stop"
    
    static let undo = live + "undo"
    static let redo = live + "redo"
    
    static let metronome = live + "metronome"
    static let overdub = live + "overdub"
    
    // Devices
    
    static let trackDeviceParam = live + "track/device/param"
    
}
