//
//  OSController.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation

/**
 OSController contains the methods to control the current Live set.
 
 - Since: 0.1
 */
public class OSController: NSObject {
    
    private let messageManager: MessageManager
    
    init(messageManager: MessageManager) {
        self.messageManager = messageManager
    }
    
    /**
     Start playing the current Live set.
     
     - Since: 0.1
     */
    @objc
    public func play() {
        messageManager.sendMessage(LiveAPI.play)
    }
    
    /**
     Stop playing the current Live set.
     
     - Since: 0.1
     */
    @objc
    public func stop() {
        messageManager.sendMessage(LiveAPI.stop)
    }
    
    /**
     Undo the previous action.
     
     - Since: 0.1
     */
    @objc
    public func undo() {
        messageManager.sendMessage(LiveAPI.undo)
    }
    
    /**
     Redo the next action.
     
     - Since: 0.1
     */
    @objc
    public func redo() {
        messageManager.sendMessage(LiveAPI.redo)
    }
    
    /**
     Set the Live set general tempo.
     
     - Parameter tempo: the Live set general tempo to set
     - Since: 0.1
     */
    @objc
    public func setTempo(tempo: Float) {
        messageManager.sendMessage(LiveAPI.tempo, [tempo])
    }
    
    /**
     Set the Live set metronome state.
     
     - Parameter enabled: the metronome state to set
     - Since: 0.1
     */
    @objc
    public func setMetronome(enabled: Bool) {
        messageManager.sendMessage(LiveAPI.metronome, [enabled.int()])
    }
    
    /**
     Set the Live set overdub state.
     
     - Parameter enabled: the overdub state to set
     - Since: 0.1
     */
    @objc
    public func setOverdub(enabled: Bool) {
        messageManager.sendMessage(LiveAPI.overdub, [enabled.int()])
    }
    
}
