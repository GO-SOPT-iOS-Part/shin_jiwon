//
//  ViewController.swift
//  Seminar-2
//
//  Created by 신지원 on 2023/06/30.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let firstView = UIView()
    let secondView = UIView()
    let thirdView = UIView()
    let fourthView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    func setStyle() {
        [firstView, secondView, thirdView, fourthView]
            .forEach{ view.addSubview($0) }
        
        view.backgroundColor = .white
        
        firstView.do {
            $0.backgroundColor = .yellow
        }
        secondView.do {
            $0.backgroundColor = .green
        }
        thirdView.do {
            $0.backgroundColor = .black
        }
        fourthView.do {
            $0.backgroundColor = .blue
        }
    }
    
    func setLayout() {
        
//      ⭐️ 1. multiplieBy 사용하여 Layout 구현 ⭐️
        firstView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalToSuperview().multipliedBy(0.25)
        }
        
        secondView.snp.makeConstraints {
            $0.top.equalTo(firstView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalToSuperview().multipliedBy(0.25)
        }
        
//      ⭐️ 2. UIScreen.main.bounds.width 사용하여 Layout 구현 ⭐️
        thirdView.snp.makeConstraints {
            $0.top.equalTo(secondView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width/2)
            $0.height.equalTo(UIScreen.main.bounds.height/4)
        }
        
        fourthView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width/2)
            $0.height.equalTo(UIScreen.main.bounds.height/4)
        }
    }
}

