import WatchKit
import Timepiece
import Foundation


class GlanceController: WKInterfaceController {

    @IBOutlet weak var ageLabel: WKInterfaceLabel!
    @IBOutlet weak var ageHeader: WKInterfaceLabel!

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
            ageHeader.setAlpha(1)
            ageLabel.setText(String(format: "%.9f", years))
        } else {
            ageLabel.setText("Enter your birthday on iOS!")
            ageHeader.setAlpha(0)
            timer?.invalidate()
        }
    }

    private func scheduleTimer() {
        timer?.invalidate()

        timer = NSTimer(timeInterval: 0.3, target: self, selector: "timerFired", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSDefaultRunLoopMode)
    }

}
