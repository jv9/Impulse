import UIKit
import Timepiece
import NotificationCenter


class ImpulseExtensionViewController: UIViewController, NCWidgetProviding {

    @IBOutlet weak var ageLabel: UILabel!

    var timer: NSTimer?

    let kSecondsPerYear: Double = 3.15569e7
    let defaults = NSUserDefaults(suiteName: "group.Jasdev.Impulse")!
    let defaultsKeyForAge = "imp_Age"

    override func viewDidLoad() {
        super.viewDidLoad()

        scheduleTimer()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        self.preferredContentSize = CGSizeMake(0, 35);
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        scheduleTimer()

        completionHandler(.NewData)
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
