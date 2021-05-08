//
//  CustomTextField.swift
//  MToon
//
//  Created by Computer on 5/7/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    var inset: UIEdgeInsets?
    
    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = radius
        }
    }
    
    @IBInspectable var padding: CGFloat = 0 {
        didSet {
            inset = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        if let inset = inset {
            return rect.inset(by: inset)
        }
        return rect
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        if let inset = inset {
            return rect.inset(by: inset)
        }
        return rect
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        if let inset = inset {
            return rect.inset(by: inset)
        }
        return rect
    }
}
