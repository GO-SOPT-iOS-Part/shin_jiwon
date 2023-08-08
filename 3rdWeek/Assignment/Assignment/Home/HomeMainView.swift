//
//  HomeContentVIew.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/08.
//

import UIKit

class HomeMainView: UIView {

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
        self.backgroundColor = .red
    }
    
    private func setLayout() {
        
    }

}
