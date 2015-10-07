import UIKit

class IMPGradientView: UIView {

    var topColor: UIColor!
    var bottomColor: UIColor!

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)

        let context = UIGraphicsGetCurrentContext()
        let locations: [CGFloat] = [0.0, 1.0]
        let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [topColor.CGColor, bottomColor.CGColor], locations)

        CGContextDrawLinearGradient(context, gradient, .zero, CGPoint(x: 0, y: bounds.size.height), CGGradientDrawingOptions(rawValue: 0))
    }
}