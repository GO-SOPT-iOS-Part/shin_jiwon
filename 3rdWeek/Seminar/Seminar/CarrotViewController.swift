//
//  ViewController.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/01.
//

import UIKit

import SnapKit

class CarrotViewController: BaseViewController {
    
    private let tableView = UITableView()
    
    private let dummy = Carrot.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setLayout() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
}

