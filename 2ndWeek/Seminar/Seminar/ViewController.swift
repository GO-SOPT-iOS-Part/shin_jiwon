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
    
    private var count = 0 {
        didSet {
            self.numberLabel.text = count > 10 ? "10번 이상 눌렀네? .. \(count)" : "조금만 더 눌러봐 .. \(count)"
        }
    }
    
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
            $0.font = .boldSystemFont(ofSize: 20)
            $0.textAlignment = .center
            $0.makeRounded(radius: 10.0)
        }
        
        modalButton.then {
            $0.setTitle("다음으로", for: .normal)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = .blue
            $0.titleLabel?.font = .boldSystemFont(ofSize: 25)
            $0.titleLabel?.textAlignment = .center
            $0.makeRounded(radius: 15.0)
            
            $0.addTarget( self,
                          action: #selector(pushSecondViewControllerTapped),
                          for: .touchUpInside)
        }
        
    }
    
    private func setLayout() {
        numberLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(70)
        }
        modalButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(numberLabel.snp.bottom).offset(20)
            $0.width.equalTo(130)
            $0.height.equalTo(70)
        }
    }
    
    func pushSecondViewController() {
        let secondViewController = SecondViewController()
        secondViewController.delegate = self
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true)
    }
    
    @objc
    func pushSecondViewControllerTapped() {
        pushSecondViewController()
    }
}

extension UIView {
    func makeRounded(radius : CGFloat) {
        layer.masksToBounds = false
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}

extension ViewController : TapButton {
    
    func buttonTapped(count: Int) {
        self.count = count
    }
}

