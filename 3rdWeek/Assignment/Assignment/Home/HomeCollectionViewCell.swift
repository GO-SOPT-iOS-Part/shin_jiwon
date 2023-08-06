//
//  HomeCollectionViewCell.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/03.
//

import UIKit

import SnapKit
import Then

final class HomeCell: UICollectionViewCell {
    
    private var HomeContentView = UIView()
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
        self.backgroundColor = .white
        self.addSubviews(HomeContentView)

    }
    
    private func layout() {
        HomeContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureCell(_ exColor : HomeColor) {
        self.HomeContentView.backgroundColor = exColor.exColor
    }
    
}
