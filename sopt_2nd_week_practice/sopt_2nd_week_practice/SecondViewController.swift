//
//  SecondViewController.swift
//  sopt_2nd_week_practice
//
//  Created by 신지원 on 2023/04/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    var id: String?
    var password: String?
    
    private let tvingImageView = UIImageView()
    private let welcomeLabel = UILabel()
    private lazy var backButtom = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setstyle()
        setLayout()
        iddataBind()
    }
    
    func iddataBind() {
        guard let id = self.id else { return }
        welcomeLabel.text = "\(id) 님 \n 반가워요!"
    }
}

private extension SecondViewController {
    
    func setstyle(){
        
        view.backgroundColor = .black
        
        tvingImageView.then {
            $0.image = UIImage(named: "tving")
        }
        welcomeLabel.then {
            $0.text = "님\n반가워요!"
            $0.numberOfLines = 2
            $0.textAlignment = .center
            $0.textColor = .tvinggray1
            $0.font = UIFont(name: "Pretendard-Bold", size: 23)
        }
        backButtom.then {
            $0.setTitle("메인으로", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.layer.backgroundColor = UIColor.tvingred.cgColor
            $0.layer.cornerRadius = 3
            
            $0.addTarget(self,
                             action: #selector(backButtonTapped),
                             for: .touchUpInside)
        }
    
    }
    
    func setLayout(){
        
        view.addSubviews(
            tvingImageView,
            welcomeLabel,
            backButtom
        )
        
        tvingImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(58)
            $0.width.equalToSuperview()
            
        }
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(backButtom.snp.top).offset(-284)
        }
        backButtom.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-66)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
    }
    
    @objc func backButtonTapped() {
        
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
