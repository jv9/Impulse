import UIKit
import Timepiece

class AgeViewController: UIViewController {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var gradientView: IMPGradientView!

    let date = NSDate.date(year: 1992, month: 1, day: 2)
    let kSecondsPerYear: Double = 3.15569e7

    override func viewDidLoad() {
        super.viewDidLoad()

        gradientView.topColor = .imp_lightBlue
        gradientView.bottomColor = .imp_darkBlue

        NSTimer.scheduledTimerWithTimeInterval(0.03, target: self, selector: "timerFired", userInfo: nil, repeats: true)
    }

    func timerFired() {
        let years = (NSDate() - date) / kSecondsPerYear
        ageLabel.text = String(format: "%.9f", years)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

