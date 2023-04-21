//
//  ModifiedTextField.swift
//  SOPT WEEK2
//
//  Created by KYUBO A. SHIM on 2023/04/14.
//

import UIKit

final class ModifiedTextField: UITextField {
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.clearButtonRect(forBounds: bounds)
        return rect.offsetBy(dx: -40, dy: 0)
    }
    
    override var rightView: UIView? {
        set {
            super.rightView = newValue
        }
        get {
            return super.rightView
        }
    }
}
