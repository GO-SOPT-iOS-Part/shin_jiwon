//
//  Extension.swift
//  sopt_2nd_week_practice
//
//  Created by 신지원 on 2023/04/20.
//

import UIKit

extension UIButton {
    func setUnderLine() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count))
        setAttributedTitle(attributedString, for: .normal)
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 14))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
}

extension UITextField {
    //placeholder 색 변경
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
}

extension FirstViewController {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField.hasText || textField.isEditing {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.tvingred.cgColor
            
            if(textField == passwordtextfield) {
                eyeButton.isHidden = false
                //clearButton.isHidden = false
                //clearButton.isEnabled = true
            }
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        textField.layer.borderWidth = 0
        
        //왜 바로 안되고 한 텀 나중에 빨개지는지 모르겠어요,,
        if idtextfield.hasText && passwordtextfield.hasText {
            loginButton.isEnabled = true
            loginButton.layer.borderWidth = 0
            loginButton.layer.backgroundColor = UIColor.tvingred.cgColor
            loginButton.setTitleColor(.white, for: .normal)
        }
        else {
            loginButton.isEnabled = false
            loginButton.layer.backgroundColor = UIColor.black.cgColor
            loginButton.setTitleColor(.tvinggray2, for: .normal)
            loginButton.layer.borderWidth = 1
        }
        
        
    }
}




