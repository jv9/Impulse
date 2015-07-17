//
//  IMPWhiteColoredDatePicker.swift
//  Impulse
//
//  Created by Jasdev Singh on 7/15/15.
//  Copyright (c) 2015 Jasdev. All rights reserved.
//

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
