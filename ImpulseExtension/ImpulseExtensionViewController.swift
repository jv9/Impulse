//
//  TodayViewController.swift
//  ImpulseExtension
//
//  Created by Jasdev Singh on 7/17/15.
//  Copyright (c) 2015 Jasdev. All rights reserved.
//

import UIKit
import NotificationCenter
import Timepiece

class ImpulseExtensionViewController: UIViewController, NCWidgetProviding {

    @IBOutlet weak var ageLabel: UILabel!

    var timer: NSTimer?

    let kSecondsPerYear: Double = 3.15569e7
    let defaults = NSUserDefaults(suiteName: "group.Jasdev.Impulse")!
    let defaultsKeyForAge = "imp_Age"

    override func viewDidLoad() {
        super.viewDidLoad()


        self.preferredContentSize = CGSizeMake(0, 35);
        scheduleTimer()
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        scheduleTimer()

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }

    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    func timerFired() {
        if let birthday = defaults.objectForKey(defaultsKeyForAge) as? NSDate {
            let years = (NSDate() - birthday) / kSecondsPerYear
            ageLabel.text = String(format: "%.9f", years)
        } else {
            ageLabel.text = "Enter your birthday!"
            timer?.invalidate()
        }
    }

    private func scheduleTimer() {
        // Invalidate any previous timer
        timer?.invalidate()

        timer = NSTimer(timeInterval: 0.03, target: self, selector: "timerFired", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSDefaultRunLoopMode)
    }
}
