//
//  SecondCollectionViewCell.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/09.
//

import UIKit

import SnapKit
import Then

final class SecondCell : UICollectionViewCell {

    private var cellView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellStyle()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellStyle() {
        self.backgroundColor = .white
        self.addSubviews(cellView)
        cellView.do {
            $0.backgroundColor = .black
        }
    }
    
    private func layout() {
        cellView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func configureCell(_ contentView : MyContentView) {
        cellView.backgroundColor = contentView.color
    }
}
