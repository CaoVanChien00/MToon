//
//  CustomTextview.swift
//  MToon
//
//  Created by Computer on 5/7/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextview: UITextView {
    @IBInspectable var isBorder: Bool = false {
        didSet {
            if isBorder {
                layer.cornerRadius = 10
            }
        }
    }
    
    @IBInspectable var valuePadding: CGFloat = 5{
        didSet {
            contentInset = UIEdgeInsets(top: valuePadding, left: valuePadding, bottom: valuePadding, right: 10)
        }
    }
    
}
