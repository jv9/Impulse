import UIKit

class IMPWhiteColoredDatePicker: UIDatePicker {
    var changed = false

    override func addSubview(view: UIView) {
        if !changed {
            changed = true
            setValue(UIColor.whiteColor(), forKey: "textColor")
        }
        
        super.addSubview(view)
    }
}
