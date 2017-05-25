//
//  TimerView.swift
//  ParentChildCallback
//
//  Created by Ciprian Rarau on 2017-01-23.
//  Copyright © 2017 Ciprian Rarau. All rights reserved.
//

import Foundation
import UIKit

enum State: String {
    case stopped = "Stopped"
    case started = "Started"
}
class TimerView: UIView {
    
    var callback: ((Int) -> ())? = nil
    
    var counter = 0
    var state: State = .stopped
    
    var timer:Timer? = Timer()

    @IBOutlet var stopStartButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()

    }
    
    func setup() {
        self.state = .stopped
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            if let callback = self.callback {
                callback(self.counter)
            }
            self.counter = self.counter + 1
        }
    }
    
    func stopTimer() {
        guard let timer = self.timer else {
            return
        }
        timer.invalidate()
    }
    
    @IBAction func timeButtonTouchUpInside(_ sender: Any) {
        guard let callback = self.callback else {
            return
        }
        
        if (state == .stopped) {
            state = .started
            stopStartButton.setTitle("Stop timer", for: .normal)
            self.startTimer()
        } else {
            state = .stopped
            stopStartButton.setTitle("Start timer", for: .normal)
            self.stopTimer()
        }
        
        if (state == .started) {
            callback(counter)
        }
    }
}
