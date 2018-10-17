//
//  LiveSetDataManager.swift
//  OscletonSDK
//
//  Created by Arthur Vimond on 12/10/2018.
//  Copyright © 2018 Arthur Vimond. All rights reserved.
//

import Foundation
import RxSwift

public class LiveSetDataManager {
    
    var tempo: Observable<Float> {
        get { return messageManager.oscMessage
                .filter { $0.address.string == LiveAPI.tempo }
                .map { $0.arguments.first!!.float() } }
    }
    
    private let messageManager: MessageManager
    
    init(messageManager: MessageManager) {
        self.messageManager = messageManager
    }
    
}
