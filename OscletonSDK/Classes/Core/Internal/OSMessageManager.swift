//
//  OSMessageManager.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//

import Foundation

public class OSMessageManager {
    
    private let oscManager: OSCManager
    
    init(oscManager: OSCManager) {
        self.oscManager = oscManager
    }
    
    public func sendMessage(address: String, args: [Any]? = nil) {
        oscManager.sendMessage(address: address, args: args)
    }
    
    func connect() {
        oscManager.connect()
    }
    
    func disconnect() {
        oscManager.disconnect()
    }
    
    func startListening() {
        oscManager.startListening()
    }
    
    func stopListening() {
        oscManager.stopListening()
    }
    
}
