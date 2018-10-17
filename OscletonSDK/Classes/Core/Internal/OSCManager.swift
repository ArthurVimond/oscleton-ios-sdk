//
//  OSCManager.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//

import Foundation
import SwiftOSC
import RxSwift

class OSCManager : OSCServerDelegate {
    
    public let oscMessage: PublishSubject<OSCMessage> = PublishSubject()
    
    private let sender = OSCClient(address: "", port: 9000)
    private let receiver = OSCServer(address: "", port: 9001)
    
    private let address = OSCAddressPattern("/")
    
    init() {
        print("OSCManager::init")
        
    }
    
    func initSender(ip: String, port: Int = 9000) -> OSResult {
        print("initSender - ip: \(ip) - port: \(port)")
        
        // TODO: Add IP validation
        
        sender.address = ip
        sender.port = port
        
        return OSResult.success
    }
    
    func connect(receiverPort: Int = 9001) {
        receiver.port = receiverPort
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
    
    func sendMessage(_ address: String, _ args: [Any]? = nil) {
        
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
        print("didReceive - message.address: \(message.address.string)")
        oscMessage.onNext(message)
    }
    
}
