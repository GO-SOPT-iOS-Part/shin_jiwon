//
//  CarrotViewController.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/20.
//

import UIKit

import SnapKit
import Then
import RealmSwift

class CarrotViewController: UIViewController {
    
    private let tableView = UITableView()
    
    let realm = try! Realm()
    
    private lazy var dummy : [CarrotResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dummy = getRealm()
        self.tableView.reloadData()
    }
    
    private func setStyle() {
        
        tableView.do {
            $0.register(CarrotTableViewCell.self, forCellReuseIdentifier: CarrotTableViewCell.identifier)
            $0.rowHeight = 120
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func setLayout() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func getRealm() -> [CarrotResult] {
        let result = realm.objects(CarrotResult.self)
            var array: [CarrotResult] = []
            result.forEach {
                array.append($0)
            }
            return array
        }
}

extension CarrotViewController: UITableViewDelegate {}

extension CarrotViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarrotTableViewCell.identifier, for: indexPath) as? CarrotTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(dummy[indexPath.row])
        
        return cell
    }
}

