//
//  HomeTabBarCollectionView.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/03.
//

import UIKit

class HomeTabBarCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        
        register()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        self.register(HomeTabBarCell.self, forCellWithReuseIdentifier: HomeTabBarCell.cellIdentifier)
    }
    
    private func setStyle() {
        self.backgroundColor = .clear
        self.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            $0.collectionViewLayout = layout
            $0.frame = .init()
            $0.showsVerticalScrollIndicator = true
            $0.showsHorizontalScrollIndicator = false
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.contentInsetAdjustmentBehavior = .never
            $0.decelerationRate = .fast
            $0.isPagingEnabled = true
        }
    }

}
