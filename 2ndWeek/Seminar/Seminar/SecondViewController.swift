//
//  SecondViewController.swift
//  Seminar
//
//  Created by 신지원 on 2023/06/28.
//

import UIKit
import SnapKit
import Then

class SecondViewController: UIViewController {

    var plzPushButton = UIButton()
    var backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    func setStyle() {
        view.addSubview(plzPushButton)
        view.addSubview(backButton)
        
        view.backgroundColor = .white
        
        plzPushButton.then {
            $0.setTitle("눌러줘", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 30)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = .blue
            $0.titleLabel?.textAlignment = .center
            $0.makeRounded(radius: 15.0)
        }
        backButton.then {
            $0.setTitle("이전으로", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 30)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = .blue
            $0.titleLabel?.textAlignment = .center
            $0.makeRounded(radius: 15.0)
        }
    }
    
    func setLayout() {
        plzPushButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(130)
            $0.height.equalTo(70)
        }
        backButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(plzPushButton.snp.bottom).offset(50)
            $0.width.equalTo(130)
            $0.height.equalTo(70)
        }
    }

}
