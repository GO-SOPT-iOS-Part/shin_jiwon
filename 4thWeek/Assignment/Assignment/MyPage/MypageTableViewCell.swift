//
//  MypageTableViewCell.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/02.
//

import UIKit

import SnapKit
import Then

class MypageTableViewCell: UITableViewCell {
    
    private var mypageTextLabel = UILabel()
    private var nextButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        
        contentView.addSubviews(mypageTextLabel, nextButton)
        contentView.backgroundColor = .black
        
        mypageTextLabel.do {
            $0.font = UIFont(name: "Pretendard-Regular", size: 15)
            $0.textColor = .tvingGray2
        }
        
        nextButton.do {
            $0.setImage(UIImage(named: "nextBtn"), for: .normal)
        }
    }

    private func setLayout() {
        
        mypageTextLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.size.equalTo(18)
        }
    }
    
    func configureCell(_ text: MyPage) {
        mypageTextLabel.text = text.text
    }
}
