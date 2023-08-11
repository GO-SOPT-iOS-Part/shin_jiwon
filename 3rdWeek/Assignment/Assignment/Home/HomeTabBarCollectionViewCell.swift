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
    
    let tabLabel = UILabel()
    let tabBar = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        target()
        
        cellStyle()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            tabLabel.font = isSelected ? UIFont(name: "Pretendard-Bold", size: 17) : UIFont(name: "Pretendard-Regular", size: 17)
            tabBar.backgroundColor = isSelected ? UIColor.white : UIColor.clear
        }
    }
    
    private func target() {
        
    }
    
    private func cellStyle() {
        self.addSubviews(tabLabel, tabBar)
        
        tabLabel.do {
            $0.font = UIFont(name: "Pretendard-Regular", size: 17)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        
        tabBar.do {
            $0.backgroundColor = .clear
        }
    }
    
    private func layout() {
        tabLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        tabBar.snp.makeConstraints {
            $0.top.equalTo(tabLabel.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(tabLabel.snp.width)
            $0.height.equalTo(3)
        }
    }
    
    func configureCell(_ text: MyList) {
        tabLabel.text = text.text
    }
}
