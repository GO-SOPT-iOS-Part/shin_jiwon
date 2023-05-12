//
//  CarrotViewController.swift
//  sopt_3rd_week
//
//  Created by 신지원 on 2023/04/22.
//

import UIKit

class CarrotViewController: BaseViewController {
    
    
    private let tableView = UITableView()
    
    private let dummy = Carrot.dummy()
    //dummy는 carrot 이라는 타입
    
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
    
//    override func setStyle() {
//        tableView.do {
//            $0.register(CarrotTableViewCell.self, forCellReuseIdentifier: CarrotTableViewCell.identifier)
//            //cell을 꾸민애를 전달해준다. 나 셀만들었어 이 셀로 써!
//            $0.rowHeight = 120
//            $0.delegate = self
//            $0.dataSource = self
//        }
//    }
    
    
}

//extension CarrotViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}



