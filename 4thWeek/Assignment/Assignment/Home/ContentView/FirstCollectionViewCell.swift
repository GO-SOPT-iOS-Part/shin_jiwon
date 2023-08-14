//
//  FirstCollectionViewCell.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/09.
//

import UIKit

import SnapKit
import Then

final class FirstCell : UICollectionViewCell {

    private var exLabel = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellStyle()
        layout()
        print("⭐️")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellStyle() {
        contentView.addSubview(exLabel)
        exLabel.do {
            $0.backgroundColor = .gray
        }
    }
    
    private func layout() {
        exLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureCell(_ contentView : MyContentView) {
        exLabel.backgroundColor = contentView.color
    }
}
