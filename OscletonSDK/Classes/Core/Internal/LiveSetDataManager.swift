//
//  LiveSetDataManager.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation
import SwiftOSC
import RxSwift

class LiveSetDataManager {
    
    var liveVersion: Observable<String> {
        return messageManager.oscMessage
            .filter { $0.address.string == LiveAPI.liveVersion }
            .map { $0.arguments.first!!.string() }
    }
    
    var tempo: Observable<Float> {
        return messageManager.oscMessage
            .filter { $0.address.string == LiveAPI.tempo }
            .map { $0.arguments.first!!.float() }
    }
    
    var deviceParameter: Observable<OSDeviceParameter> {
        return _deviceParameter
    }
    
    // Private properties
    
    private let messageManager: MessageManager
    private let disposeBag = DisposeBag()
    
    // Data
    private var tracks: [Int : OSTrack] = [:]
    private var devices: [OSDeviceIndices : OSDevice] = [:]
    private var deviceParameters: [OSDeviceParameterIndices : OSDeviceParameter] = [:]
    
    private let currentDeviceParameterIndices: PublishSubject<OSDeviceParameterIndices> = PublishSubject()
    private let _deviceParameter: PublishSubject<OSDeviceParameter> = PublishSubject()
    
    init(messageManager: MessageManager) {
        self.messageManager = messageManager
        
        observeDeviceParameterProperties()
    }
    
    private func observeDeviceParameterProperties() {
    
        // Update data structures on device parameter changes
        messageManager.oscMessage
            .filter { $0.address.string == LiveAPI.trackDeviceParam }
            .map(mapToDeviceParameter)
            .subscribe(onNext: { [unowned self] deviceParam in
        
                // Create new track (if needed)
                if (self.tracks.first { $0.key == deviceParam.trackIndex } == nil) {
                    let track = OSTrack(index: deviceParam.trackIndex)
                    self.tracks.updateValue(track, forKey: deviceParam.trackIndex)
                }

                // Update track index (if needed)
                var savedTrack = self.tracks.first { $0.key == deviceParam.trackIndex }!.value
                if (savedTrack.index != deviceParam.trackIndex) {
                    savedTrack.index = deviceParam.trackIndex
                    self.tracks.updateValue(savedTrack, forKey: deviceParam.trackIndex)
                }

                // Create new device (if needed)
                let deviceIndices = OSDeviceIndices(trackIndex: deviceParam.trackIndex, deviceIndex: deviceParam.deviceIndex)
                if (self.devices.first { $0.key == deviceIndices } == nil) {
                    let device = OSDevice(trackIndex: deviceParam.trackIndex, deviceIndex: deviceParam.deviceIndex)
                    self.devices.updateValue(device, forKey: deviceIndices)
                }

                // Update device (if needed)
                var savedDevice = self.devices.first { $0.key == deviceIndices }!.value
                if (savedDevice.trackIndex != deviceParam.trackIndex || savedDevice.deviceIndex != deviceParam.deviceIndex) {
                    savedDevice.trackIndex = deviceParam.trackIndex
                    savedDevice.deviceIndex = deviceParam.deviceIndex
                    self.devices.updateValue(savedDevice, forKey: deviceIndices)
                }

                // Update device parameter
                let deviceParamIndices = OSDeviceParameterIndices(trackIndex: deviceParam.trackIndex,
                                                                deviceIndex: deviceParam.deviceIndex,
                                                                paramIndex: deviceParam.paramIndex)
                self.deviceParameters.updateValue(deviceParam, forKey: deviceParamIndices)
        
            })
            .disposed(by: disposeBag)
        
        // Emit current device parameter indices
        messageManager.oscMessage
            .filter { $0.address.string == LiveAPI.trackDeviceParam }
            .map(mapToDeviceParameterIndices)
            .subscribe(onNext: { [unowned self] deviceParameterIndices in
                self.currentDeviceParameterIndices.onNext(deviceParameterIndices)
            })
            .disposed(by: disposeBag)
        

        // Emit full device parameter info from dictionary
        currentDeviceParameterIndices
            .subscribe(onNext: { [unowned self] deviceParameterIndices in
                if let deviceParam = self.deviceParameters[deviceParameterIndices] {
                    self._deviceParameter.onNext(deviceParam)
                }
            })
            .disposed(by: disposeBag)
    
    }
    
    // Mapper functions
    
    private func mapToDeviceParameter(oscMessage: OSCMessage) -> OSDeviceParameter {
    
        let trackIndex = oscMessage.arguments[0]!.int()
        let deviceIndex = oscMessage.arguments[1]!.int()
        let paramIndex = oscMessage.arguments[2]!.int()
        let trackName = oscMessage.arguments[3]!.string()
        let deviceName = oscMessage.arguments[4]!.string()
        let paramName = oscMessage.arguments[5]!.string()
        let displayValue = oscMessage.arguments[6]!.string()
        let value = oscMessage.arguments[7]!.float()
        let min = oscMessage.arguments[8]!.float()
        let max = oscMessage.arguments[9]!.float()
        
        return OSDeviceParameter(
            trackIndex: trackIndex,
            deviceIndex: deviceIndex,
            paramIndex: paramIndex,
            trackName: trackName,
            deviceName: deviceName,
            paramName: paramName,
            displayValue: displayValue,
            value: value,
            min: min,
            max: max)
    }
    
    private func mapToDeviceParameterIndices(oscMessage: OSCMessage) -> OSDeviceParameterIndices {
        
        let trackIndex = oscMessage.arguments[0]!.int()
        let deviceIndex = oscMessage.arguments[1]!.int()
        let paramIndex = oscMessage.arguments[2]!.int()
        
        return OSDeviceParameterIndices(
            trackIndex: trackIndex,
            deviceIndex: deviceIndex,
            paramIndex: paramIndex)
    }
    
}
