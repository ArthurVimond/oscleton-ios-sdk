//
//  MessageManager.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//

import Foundation
import SwiftOSC
import RxSwift

public class MessageManager {
    
    var oscMessage: Observable<OSCMessage> {
        return oscManager.oscMessage
    }
    
    private let oscManager: OSCManager
    
    init(oscManager: OSCManager) {
        self.oscManager = oscManager
    }
    
    func initSender(ip: String, port: Int = 9000) -> OSResult {
        let result = oscManager.initSender(ip: ip, port: port)
        
        if result != .success {
            return result
        }
        
        // Set peer
        setPeer()
        
        // Request current state
        requestCurrentState()
        
        return result
    }
    
    private func setPeer() {
        
        guard let ipAddress = NetworkUtils.deviceIPAddress()
            else { return }
        
        print("setPeer - ipAddress: \(ipAddress)")
        let args: [Any] = [ipAddress, 9001]
        sendMessage(LiveAPI.setPeer, args)
    }
    
    private func requestCurrentState() {
        print("requestCurrentState")
    
//        sendMessage(LiveAPI.liveVersion)
//        sendMessage(LiveAPI.scriptVersion)
//
        sendMessage(LiveAPI.tempo)
//
//        sendMessage(LiveAPI.masterVolume)
//        sendMessage(LiveAPI.masterPanning)
    
    }
    
    public func sendMessage(_ address: String, _ args: [Any]? = nil) {
        oscManager.sendMessage(address, args)
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
