//
//  InterfaceController.swift
//  Impulse WatchKit Extension
//
//  Created by Jasdev Singh on 7/19/15.
//  Copyright (c) 2015 Jasdev. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var ageLabel: WKInterfaceLabel!

    var timer: NSTimer?

    let kSecondsPerYear: Double = 3.15569e7
    let defaults = NSUserDefaults(suiteName: "group.Jasdev.Impulse")!
    let defaultsKeyForAge = "imp_Age"

    override func willActivate() {
        scheduleTimer()
    }

    override func didDeactivate() {
        super.didDeactivate()

        timer?.invalidate()
    }

    func timerFired() {
        if let birthday = defaults.objectForKey(defaultsKeyForAge) as? NSDate {
            let years = (NSDate() - birthday) / kSecondsPerYear
            ageLabel.setText(String(format: "%.9f", years))
        } else {
            ageLabel.setText("Enter your birthday on iOS!")
            timer?.invalidate()
        }
    }

    private func scheduleTimer() {
        timer?.invalidate()

        timer = NSTimer(timeInterval: 0.3, target: self, selector: "timerFired", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSDefaultRunLoopMode)
    }
}
