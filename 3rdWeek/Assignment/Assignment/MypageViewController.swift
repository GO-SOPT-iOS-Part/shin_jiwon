//
//  MypageViewController.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/02.
//

import UIKit

import SnapKit
import Then

class MypageViewController: UIViewController, MypageHeaderViewDelegate, MypageFooterViewDelegate {
    
    private let dummy1 = MyPage.dummy1()
    private let dummy2 = MyPage.dummy2()
    
    private let rootView = MypageTableView()
    private let headerView = MypageHeaderView()
    private let footerView = MypageFooterView()
    
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
        switch section {
        case 0 : return 341
        case 1 : return 0
        default : return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MypageHeaderView.cellIdentifier) as? MypageHeaderView else { return UIView()}
        header.delegate = self
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0 : return 32
        case 1 : return 205
        default : return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: MypageFooterView.cellIdentifier) as? MypageFooterView else { return UIView()}
        footer.delegate = self
        switch section {
        case 0 : footer.logoutButton.isHidden = true
        case 1 : footer.divideLine.isHidden = true
        default : print("Error")
        }
        return footer
    }
    
    func tableView(_ tableView: UITableView, shouldScrollHorizontallyToItemAt section: Bool) -> Bool {
        return false
    }
}

extension MypageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 : return dummy1.count
        case 1 : return dummy2.count
        default : return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MypageTableViewCell.cellIdentifier, for: indexPath) as? MypageTableViewCell else { return UITableViewCell() }
        
        switch indexPath.section {
        case 0 : cell.configureCell(dummy1[indexPath.row])
        case 1 : cell.configureCell(dummy2[indexPath.row])
        default : print("Error")
        }
        return cell
    }
    
    
}
