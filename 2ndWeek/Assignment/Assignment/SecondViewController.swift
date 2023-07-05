//
//  SecondViewController.swift
//  Assignment
//
//  Created by 신지원 on 2023/07/04.
//

import UIKit

class SecondViewController: UIViewController {

    private var tvingLogoImage = UIImageView()
    private var showidLabel = UILabel()
    private var backButton = UIButton()
    
    var id : String?
    var nickname : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setLayout()
        print("💛\(nickname)")
        NotificationCenter.default.addObserver(self, selector: #selector(nickNameReceived(_:)), name: NSNotification.Name("nickName"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    private func setStyle() {
        view.addSubviews(tvingLogoImage,showidLabel,backButton)
        view.backgroundColor = .black
        
        tvingLogoImage.then {
            $0.image = UIImage(named: "tvingLogo")
        }
        showidLabel.then {
            $0.text = "\(id) 님\n반가워요!"
            $0.font = UIFont(name: "Pretendard-Bold", size: 23)
            $0.textColor = .tvingGray1
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
        backButton.then {
            $0.setTitle("메인으로", for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 14)
            $0.titleLabel?.textColor = .white
            $0.layer.backgroundColor = UIColor.tvingRed.cgColor
            
            $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        
        tvingLogoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.width.equalToSuperview()
            $0.height.equalTo(210)
        }
        showidLabel.snp.makeConstraints {
            $0.top.equalTo(tvingLogoImage.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
        }
        backButton.snp.makeConstraints {
            $0.top.equalTo(tvingLogoImage.snp.bottom).offset(425)
            $0.height.equalTo(52)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc
        func nickNameReceived(_ notification: NSNotification) {
            nickname = "\(notification.userInfo!["nickname"]!)"
            showidLabel.text = "\(nickname) 님\n반가워요!"
            print("💛\(nickname)")
        }
}
