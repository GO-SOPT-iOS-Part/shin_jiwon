//
//  MypageViewController.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/02.
//

import UIKit

import SnapKit
import Then

class MypageViewController: UIViewController {
    
    private let dummy1 = MyPage.dummy1()
    private let dummy2 = MyPage.dummy2()
    
    private let rootView = MypageTableView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        target()
        delegate()
    }
    
    private func target() {
        
    }
    
    private func delegate() {
        
        rootView.delegate = self
        rootView.dataSource = self
    }
    
}

extension MypageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 371
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 371
    }
    
    func tableView(_ tableView: UITableView, shouldScrollHorizontallyToItemAt section: Bool) -> Bool {
        return false
    }
}

extension MypageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MypageTableViewCell.cellIdentifier, for: indexPath) as? MypageTableViewCell else { return UITableViewCell() }
        cell.configureCell(dummy1[indexPath.row])
        return cell
    }
    
    
}
