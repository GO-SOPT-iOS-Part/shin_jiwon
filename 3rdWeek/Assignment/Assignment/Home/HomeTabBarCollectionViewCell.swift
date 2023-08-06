//
//  HomeTabBarCollectionViewCell.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/03.
//

import UIKit

import SnapKit
import Then

struct MyList {
    let text: String
}

extension MyList {
    
    static func dummy() -> [MyList] {
        return [MyList(text: "홈"),
                MyList(text: "실시간"),
                MyList(text: "TV프로그램"),
                MyList(text: "영화"),
                MyList(text: "파라마운트+"),
                MyList(text: "키즈")]
    }
}

class HomeTabBarCell: UICollectionViewCell {
    
    let tabButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        target()
        
        cellStyle()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func target() {
        
    }
    
    private func cellStyle() {
        self.addSubviews(tabButton)
        
        tabButton.do {
            $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 17)
            $0.titleLabel?.textColor = .white
            $0.titleLabel?.textAlignment = .center
        }
    }
    
    private func layout() {
        tabButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    func configureCell(_ text: MyList) {
        tabButton.setTitle(text.text, for: .normal)
    }
}
