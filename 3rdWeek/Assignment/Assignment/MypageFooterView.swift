//
//  MypageFooterView.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/02.
//

import UIKit

import SnapKit
import Then

protocol MypageFooterViewDelegate: AnyObject {
}

class MypageFooterView: UITableViewHeaderFooterView {
    
    weak var delegate: MypageFooterViewDelegate?

    private let logoutButton = UIButton()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        
        self.backgroundColor = .black
        self.addSubview(logoutButton)
        
        logoutButton.do {
            $0.setTitle("로그아웃", for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 14)
            $0.titleLabel?.textColor = UIColor.tvingGray2
            $0.layer.borderColor = UIColor.tvingGray4.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 2
        }
    }
    
    private func setLayout() {
        
        logoutButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(8)
            $0.height.equalTo(55)
        }
    }

}
