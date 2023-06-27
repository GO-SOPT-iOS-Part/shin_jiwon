//
//  ViewController.swift
//  Seminar
//
//  Created by 신지원 on 2023/06/28.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    var numberLabel = UILabel()
    var modalButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    private func setStyle() {
        view.addSubview(numberLabel)
        view.addSubview(modalButton)
        
        view.backgroundColor = .white
        
        numberLabel.do {
            $0.text = "조금만 더 눌러봐"
            $0.textColor = .white
            $0.backgroundColor = .black
            $0.font = .boldSystemFont(ofSize: 30)
            $0.textAlignment = .center
        }
        
        modalButton.then {
            $0.setTitle("다음으로", for: .normal)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = .blue
            $0.titleLabel?.font = .boldSystemFont(ofSize: 25)
            $0.titleLabel?.textAlignment = .center
        }
        
    }
    
    private func setLayout() {
        numberLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(70)
        }
        modalButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(numberLabel.snp.bottom).offset(20)
            $0.width.equalTo(130)
            $0.height.equalTo(70)
        }
    }
}

