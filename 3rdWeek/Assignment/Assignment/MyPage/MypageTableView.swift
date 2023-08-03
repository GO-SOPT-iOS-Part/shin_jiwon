//
//  MypageTableView.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/02.
//

import UIKit

class MypageTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped)
        
        register()
        setStyle()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        
        self.register(MypageHeaderView.self, forHeaderFooterViewReuseIdentifier: MypageHeaderView.cellIdentifier)
        self.register(MypageFooterView.self, forHeaderFooterViewReuseIdentifier: MypageFooterView.cellIdentifier)
        self.register(MypageTableViewCell.self, forCellReuseIdentifier: MypageTableViewCell.cellIdentifier)
    }
    
    private func setStyle() {
        
        self.do {
            $0.backgroundColor = .black
            $0.showsVerticalScrollIndicator = true
            $0.separatorStyle = .none
            $0.isScrollEnabled = true
        }
    }

}
