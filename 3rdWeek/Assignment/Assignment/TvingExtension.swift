//
//  TvingExtension.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/02.
//

import UIKit

extension UIColor {
    
    static let tvingRed = UIColor(hex: 0xFF143C)
    static let tvingGray5 = UIColor(hex: 0x191919)
    static let tvingGray4 = UIColor(hex: 0x2E2E2E)
    static let tvingGray3 = UIColor(hex: 0x626262)
    static let tvingGray2 = UIColor(hex: 0x9C9C9C)
    static let tvingGray1 = UIColor(hex: 0xD6D6D6)
    
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

extension UITextField {
    
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
    
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 14))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

extension String {
    
    func isValidEmail() -> Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
        return true
    }
    
    func isOnlyKorean() -> Bool {
        let pattern = "[가-힣]"
        guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
        return true
    }
}



