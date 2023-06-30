//
//  SecondViewController.swift
//  Seminar
//
//  Created by 신지원 on 2023/06/28.
//

import UIKit
import SnapKit
import Then

@objc
protocol TapButton : AnyObject {
    @objc optional func buttonTapped(count : Int)
    
//    protocol 로 TapButton 에 대한 양식을 짜주었다
//    그리고 아래서 [extension ViewController : TapButton ~] 을 선언하여
//    count 에 대한 선언 추가!
    
//    protocol 은 어디에나 해도 된다. 그럼 왜 세컨뷰에다가 했는가?
//    보통 데이터를 넘겨주는 쪽에서 protocol 을 선언한다. 따라서 세컨뷰에다 선언!
    
}

class SecondViewController: UIViewController {

    var plzPushButton = AnimationButton()
    var backButton = AnimationButton()
    
    private var tappedCount : Int = 0
    weak var delegate: TapButton?
    
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
            
            $0.addTarget(self,
                         action: #selector(countButtonTapped),
                         for: .touchUpInside)
        }
        backButton.then {
            $0.setTitle("이전으로", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 30)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = .blue
            $0.titleLabel?.textAlignment = .center
            $0.makeRounded(radius: 15.0)
            
            $0.addTarget(self,
                         action: #selector(backButtonTapped),
                         for: .touchUpInside)
        }
    }
    
    func setLayout() {
        plzPushButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(350)
            $0.width.equalTo(130)
            $0.height.equalTo(70)
        }
        backButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(plzPushButton.snp.bottom).offset(30)
            $0.width.equalTo(130)
            $0.height.equalTo(70)
        }
    }
    
    @objc
    func backButtonTapped() {
        delegate?.buttonTapped?(count: tappedCount)
        self.dismiss(animated: true)
    }
    
    @objc
    func countButtonTapped() {
        tappedCount += 1
    }

}
