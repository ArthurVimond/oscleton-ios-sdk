//
//  OSCManager.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//

import Foundation
import SwiftOSC

class OSCManager : OSCServerDelegate {
    
    private let receiver = OSCServer(address: "", port: 9001)
    private let sender = OSCClient(address: "localhost", port: 9000)
    
    private let address = OSCAddressPattern("/")
    
    init() {
        print("OSCManager::init")
        
        // Set sender ip (temp)
        sender.address = "192.168.4.186"
        
    }
    
    func connect() {
        receiver.start()
    }
    
    func startListening() {
        receiver.delegate = self
    }
    
    func stopListening() {
        receiver.delegate = nil
    }
    
    func disconnect() {
        receiver.stop()
    }
    
    func sendMessage(address: String, args: [Any]? = nil) {
        
        let oscAddress = OSCAddressPattern(address)
        let oscMessage = OSCMessage(oscAddress)
        
        if let args = args {
            args.forEach { arg in
                switch arg {
                case let int as Int:
                    oscMessage.add(int)
                    
                case let float as Float:
                    oscMessage.add(float)
                    
                case let bool as Bool:
                    oscMessage.add(bool)
                    
                case let string as String:
                    oscMessage.add(string)
                    
                default: break
                }
            }
        }
        
        sender.send(oscMessage)
    }
    
    // OSCServerDelegate
    
    func didReceive(_ message: OSCMessage) {
        print("didReceive - message.address: \(message.address)")
    }
    
    
    
}
