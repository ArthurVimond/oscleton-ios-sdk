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
    
}
