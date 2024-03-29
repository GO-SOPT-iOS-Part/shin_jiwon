//
//  HomeView.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/03.
//

import UIKit

import SnapKit
import Then

final class HomeView: UIView {

    // MARK: - UI Components
    
    public lazy var tabBarView = HomeTabBarCollectionView()
    public lazy var homeContentView = HomeCollectionView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    
    private func setStyle() {
        
        self.backgroundColor = .black
        self.addSubviews(homeContentView, tabBarView)
        
        tabBarView.do {
            $0.backgroundColor = .clear
        }
        
        homeContentView.do {
            $0.backgroundColor = .black
        }
        
        
    }
    
    private func setLayout() {
        
        tabBarView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(99)
            $0.width.equalToSuperview()
            $0.height.equalTo(54)
        }
        
        homeContentView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview().inset(50)
        }
        
    }

}
