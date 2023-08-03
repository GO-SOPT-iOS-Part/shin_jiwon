//
//  HomeCollectionView.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/03.
//

import UIKit

class HomeCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        
        register()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        
    }
    
    private func setStyle() {
        
    }
}
