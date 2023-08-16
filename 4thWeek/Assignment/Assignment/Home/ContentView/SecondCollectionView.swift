//
//  SecondCollectionView.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/09.
//

import UIKit

import SnapKit
import Then

final class SecondCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout.init() )
        
        register()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        self.register(SecondCell.self, forCellWithReuseIdentifier: SecondCell.cellIdentifier)
    }

    private func style() {
        self.do{
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 98, height: 146)
            
            $0.isScrollEnabled = true
            $0.collectionViewLayout = layout
            $0.frame = .init()
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.contentInsetAdjustmentBehavior = .never
            $0.backgroundColor = .black
        }
    }
}
