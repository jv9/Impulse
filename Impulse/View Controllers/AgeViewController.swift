import UIKit
import Timepiece

class AgeViewController: UIViewController {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var gradientView: IMPGradientView!

    var timer: NSTimer?

    let kSecondsPerYear: Double = 3.15569e7

    override func viewDidLoad() {
        super.viewDidLoad()

        gradientView.topColor = .imp_lightBlue
        gradientView.bottomColor = .imp_darkBlue

        scheduleTimer()
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

    @IBAction func settingsPressed(sender: UIButton) {
        let settingsStoryboard = UIStoryboard(name: "Settings", bundle: nil)
        let settingsVC = settingsStoryboard.instantiateInitialViewController() as! SettingsViewController

        settingsVC.modalPresentationStyle = .OverCurrentContext
        settingsVC.delegate = self

        presentViewController(settingsVC, animated: true, completion: nil)
    }

    private func scheduleTimer() {
        // Invalidate any previous timer
        timer?.invalidate()

        timer = NSTimer(timeInterval: 0.03, target: self, selector: "timerFired", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSDefaultRunLoopMode)
    }
}

// MARK: SettingsDelegate
extension AgeViewController: SettingsDelegate {
    func setBirthday(date: NSDate) {
        defaults.setObject(date, forKey: defaultsKeyForAge)
        defaults.synchronize()
        scheduleTimer()
    }
}