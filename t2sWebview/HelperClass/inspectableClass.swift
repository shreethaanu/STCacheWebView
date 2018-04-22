//
//  Inspectableclass.swift
//  t2sWebview
//
//  Created by Shree Thaanu on 4/21/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit


@IBDesignable extension UIView {
    // border color extension storyboard settings
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    // border width extension storyboard settimgs
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    // corner radius extension storyboard settimgs
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}
