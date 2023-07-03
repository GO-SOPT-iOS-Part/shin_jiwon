//
//  ViewController.swift
//  Assignment
//
//  Created by 신지원 on 2023/07/01.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    private var titleLabel = UILabel()
    
    private var idTextField = UITextField()
    private var passwordTextField = UITextField()
    private var loginButton = UIButton()
    
    private var findidButton = UIButton()
    private var findpasswordButton = UIButton()
    private var sidebar = UIView()
    
    private var noticeLabel = UILabel()
    private var makenicknameButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    private func setStyle() {
        view.backgroundColor = .black
        
        view.addSubviews(titleLabel,
                         idTextField, passwordTextField,loginButton,
                         findidButton, findpasswordButton, sidebar,
                         noticeLabel, makenicknameButton)
        
        titleLabel.then {
            $0.text = "TVING ID 로그인"
            $0.font = UIFont(name: "Pretendard-Regular", size: 23)
            $0.textColor = .tvingGray1
        }
        idTextField.then {
            $0.placeholder = "아이디"
            $0.setPlaceholder(color: .tvingGray2)
            $0.font = UIFont(name: "Pretendard-Bold", size: 15)
            $0.textColor = .tvingGray2
            $0.layer.backgroundColor = UIColor.tvingGray4.cgColor
            $0.layer.cornerRadius = 3
        }
        passwordTextField.then {
            $0.placeholder = "비밀번호"
            $0.setPlaceholder(color: .tvingGray2)
            $0.font = UIFont(name: "Pretendard-Bold", size: 15)
            $0.textColor = .tvingGray2
            $0.layer.backgroundColor = UIColor.tvingGray4.cgColor
            $0.layer.cornerRadius = 3
        }
        loginButton.then {
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.layer.backgroundColor = UIColor.tvingGray4.cgColor
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 14)
            $0.titleLabel?.textAlignment = .center
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.tvingGray2.cgColor
            $0.layer.cornerRadius = 3
        }
        
        findidButton.then {
            $0.setTitle("아이디 찾기", for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 14)
        }
        findpasswordButton.then {
            $0.setTitle("비밀번호 찾기", for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 14)
        }
        sidebar.then {
            $0.backgroundColor = .tvingGray4
        }
        
        noticeLabel.then {
            $0.text = "아직 계정이 없으신가요?"
            $0.font = UIFont(name: "Pretendard-Regular", size: 14)
            $0.textColor = .tvingGray3
        }
        makenicknameButton.then {
            $0.setTitle("닉네임 만들러가기", for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 14)
        }
        
    }
    
    private func setLayout() {
        
        titleLabel.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(90)
        }
        idTextField.snp.makeConstraints() {
            $0.top.equalTo(titleLabel.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        passwordTextField.snp.makeConstraints() {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        loginButton.snp.makeConstraints() {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        findidButton.snp.makeConstraints() {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.trailing.equalTo(sidebar.snp.leading).offset(-33)
        }
        findpasswordButton.snp.makeConstraints() {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalTo(sidebar.snp.leading).offset(36)
        }
        sidebar.snp.makeConstraints() {
            $0.top.equalTo(loginButton.snp.bottom).offset(36)
            $0.width.equalTo(1)
            $0.height.equalTo(12)
            $0.centerX.equalToSuperview()
        }
        noticeLabel.snp.makeConstraints() {
            $0.top.equalTo(findidButton.snp.bottom).offset(28)
            $0.trailing.equalTo(sidebar.snp.trailing)
        }
        makenicknameButton.snp.makeConstraints() {
            $0.top.equalTo(noticeLabel.snp.top)
            $0.leading.equalTo(noticeLabel.snp.trailing).offset(17)
        }
    }
    
    
}

