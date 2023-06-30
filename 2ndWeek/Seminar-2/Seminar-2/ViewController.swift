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
            $0.backgroundColor = .green
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
        
        
    }


}

