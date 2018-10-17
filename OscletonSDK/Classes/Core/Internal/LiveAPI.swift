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
    static let setPeer = live + "set_peer"
    
    // Transport
    
    static let tempo = live + "tempo"
    
    static let play = live + "play"
    static let stop = live + "stop"
    
}
