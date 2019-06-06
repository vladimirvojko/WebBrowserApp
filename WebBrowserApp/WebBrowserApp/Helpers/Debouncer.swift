//
//  Debouncer.swift
//  WebBrowserApp
//
//  Created by Developer on 6/6/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit
import Dispatch

class Debouncer {
    
    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
    
    typealias Handler = () -> Void
    var handler: Handler?
    
    private let timeInterval: TimeInterval
    
    private var timer: Timer?

    func renewInterval() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false, block: { [weak self] timer in
            self?.handleTimer(timer)
        })
    }
    
    private func handleTimer(_ timer: Timer) {
        guard timer.isValid else {
            return
        }
        handler?()
        handler = nil
    }
    
}
