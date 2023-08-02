//
//  MypageHeaderView.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/02.
//

import UIKit

class MypageHeaderView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        
        self.backgroundColor = .black
        
    }
    
    private func setLayout() {
        
    }

}
