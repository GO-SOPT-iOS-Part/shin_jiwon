//
//  FourthCollectionViewCell.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/09.
//

import UIKit

import UIKit

import SnapKit
import Then

final class FourthCell : UICollectionViewCell {

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
    }
    
    private func layout() {
        
    }
    
    func configureCell(_ contentView : MyContentView) {
        self.backgroundColor = contentView.color
    }
}
