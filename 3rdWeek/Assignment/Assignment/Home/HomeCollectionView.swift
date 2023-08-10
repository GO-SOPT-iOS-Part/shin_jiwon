//
//  HomeCollectionView.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/03.
//

import UIKit

class HomeCollectionView: UICollectionView {

    var contentIndexDelegate : findIndexDelegate?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        
        register()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        self.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.cellIdentifier)
    }
    
    private func setStyle() {
        self.backgroundColor = .black
        self.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0)
            $0.collectionViewLayout = layout
            $0.frame = .init()
            $0.showsVerticalScrollIndicator = true
            $0.showsHorizontalScrollIndicator = false
            $0.decelerationRate = .fast
            $0.isPagingEnabled = true
        }
    }
}
