//
//  OSCallbackReceiver.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 31/10/2018.
//

import Foundation
import RxSwift

/**
 OSCallbackReceiver contains callbacks triggered by the Live set data changes.
 
 If you prefer using a reactive approach, consider implementing [OSReactiveReceiver](../OSReactiveReceiver) instead.
 
 Since: 0.1
 */
public class OSCallbackReceiver: NSObject {
    
    // Private properties
    
    private let liveSetDataManager: LiveSetDataManager
    
    private let compositeDisposable = CompositeDisposable()
    private var tempoDisp: Disposable?
    private var deviceParameterDisp: Disposable?
    
    init(liveSetDataManager: LiveSetDataManager) {
        self.liveSetDataManager = liveSetDataManager
    }
    
    @objc(setOnTempoChangeCallback:)
    public func setOnTempoChangeCallback(onChange: @escaping (Float) -> Void) {
        tempoDisp = liveSetDataManager.tempo
            .subscribe(onNext: { tempo in
                onChange(tempo)
            })
        _ = compositeDisposable.insert(tempoDisp!)
    }
    
    @objc(setOnDeviceParameterChangeCallback:)
    public func setOnDeviceParameterChangeCallback(onChange: @escaping (OSDeviceParameter) -> Void) {
        deviceParameterDisp = liveSetDataManager.deviceParameter
            .subscribe(onNext: { param in
                onChange(param)
            })
        _ = compositeDisposable.insert(deviceParameterDisp!)
    }
    
    @objc
    public func removeOnTempoChangeCallback() {
        tempoDisp?.dispose()
    }
    
    @objc
    public func removeOnDeviceParameterChangeCallback() {
        deviceParameterDisp?.dispose()
    }
    
    @objc
    public func removeAllCallbacks() {
        compositeDisposable.dispose()
    }
    
}
