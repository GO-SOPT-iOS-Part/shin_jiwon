//
//  ViewController.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/15.
//

import UIKit

import SnapKit
import Then

class WeatherViewController : UIViewController {

    let cities = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }

    func loadData() {
        tableView.reloadData()
    }

    func setStyle() {

        view.backgroundColor = .white

        tableView.do {
            $0.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
            $0.showsVerticalScrollIndicator = true
            $0.rowHeight = 120
            $0.delegate = self
            $0.dataSource = self
        }
    }

    func setLayout() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.height.equalTo(2400)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}
