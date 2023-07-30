//
//  ViewController.swift
//  Assignment
//
//  Created by 신지원 on 2023/07/01.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    private var titleLabel = UILabel()
    
    private var idTextField = UITextField()
    private var passwordTextField = UITextField()
    private var clearButton = UIButton()
    private var eyeButton = UIButton()
    private var loginButton = UIButton()
    
    private var findidButton = UIButton()
    private var findpasswordButton = UIButton()
    private var sidebar = UIView()
    
    private var noticeLabel = UILabel()
    private lazy var makenicknameButton = UIButton()
    
    var nickname : String?
    
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
                         clearButton, eyeButton,
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
            $0.addLeftPadding()
            
            $0.addTarget(self, action: #selector(textFieldStartChange), for: .editingChanged)
            $0.addTarget(self, action: #selector(textFieldEndChange), for: .editingDidEnd)
        }
        passwordTextField.then {
            $0.placeholder = "비밀번호"
            $0.setPlaceholder(color: .tvingGray2)
            $0.font = UIFont(name: "Pretendard-Bold", size: 15)
            $0.textColor = .tvingGray2
            $0.layer.backgroundColor = UIColor.tvingGray4.cgColor
            $0.layer.cornerRadius = 3
            $0.addLeftPadding()
            
            $0.addTarget(self, action: #selector(textFieldStartChange), for: .editingChanged)
            $0.addTarget(self, action: #selector(textFieldEndChange), for: .editingDidEnd)
            
            $0.isSecureTextEntry = true
        }
        clearButton.then {
            $0.setImage(UIImage(named: "clearBtn"), for: .normal)
            $0.isHidden = true
            
            $0.addTarget(self, action: #selector(clearBtnTapped(sender:)), for: .touchUpInside)
        }
        eyeButton.then {
            $0.setImage(UIImage(named: "noeyeBtn"), for: .normal)
            $0.setImage(UIImage(named: "eyeBtn"), for: .selected)
            $0.isHidden = true
            
            $0.addTarget(self, action: #selector(eyeBtnTapped), for: .touchUpInside)
        }
        loginButton.then {
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.layer.backgroundColor = UIColor.label.cgColor
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 14)
            $0.titleLabel?.textAlignment = .center
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.tvingGray4.cgColor
            $0.layer.cornerRadius = 3
            
            $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
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
            
            $0.addTarget(self, action: #selector(makenicknameButtonTapped), for: .touchUpInside)
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
        clearButton.snp.makeConstraints() {
            $0.centerY.equalTo(passwordTextField.snp.centerY)
            $0.trailing.equalToSuperview().inset(76)
            $0.size.equalTo(20)
        }
        eyeButton.snp.makeConstraints() {
            $0.centerY.equalTo(clearButton.snp.centerY)
            $0.trailing.equalToSuperview().inset(40)
            $0.size.equalTo(20)
        }
        loginButton.snp.makeConstraints() {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        findidButton.snp.makeConstraints() {
            $0.centerY.equalTo(sidebar.snp.centerY)
            $0.trailing.equalTo(sidebar.snp.leading).offset(-33)
        }
        findpasswordButton.snp.makeConstraints() {
            $0.centerY.equalTo(sidebar.snp.centerY)
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
            $0.centerY.equalTo(noticeLabel.snp.centerY)
            $0.leading.equalTo(noticeLabel.snp.trailing).offset(17)
        }
    }
    
    @objc func textFieldStartChange(_ TextField: UITextField) {
        TextField.layer.borderColor = UIColor.tvingGray2.cgColor
        TextField.layer.borderWidth = 1
        
        if passwordTextField.hasText {
            clearButton.isHidden = false
            eyeButton.isHidden = false
        }
        else if !passwordTextField.hasText {
            clearButton.isHidden = true
            eyeButton.isHidden = true
        }
        
        if idTextField.hasText && ((idTextField.text?.isValidEmail()) == true) && passwordTextField.hasText {
            loginButton.layer.backgroundColor = UIColor.tvingRed.cgColor
            loginButton.layer.borderColor = UIColor.tvingRed.cgColor
            loginButton.setTitleColor(.white, for: .normal)
        }
        else if !idTextField.hasText || !passwordTextField.hasText || ((idTextField.text?.isValidEmail()) == false) {
            loginButton.layer.backgroundColor = UIColor.label.cgColor
            loginButton.layer.borderColor = UIColor.tvingGray4.cgColor
            loginButton.setTitleColor(.tvingGray2, for: .normal)
        }
    }
    
    @objc func textFieldEndChange(_ TextField: UITextField) {
        TextField.layer.borderWidth = 0
    }
    
    @objc func clearBtnTapped(sender : AnyObject) {
        self.passwordTextField.text = ""
        clearButton.isHidden.toggle()
        eyeButton.isHidden.toggle()
    }
    
    @objc func eyeBtnTapped() {
        self.passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func loginButtonTapped() {
        let secondVC = SecondViewController()
        guard let id = idTextField.text else { return }
        guard let nickname = nickname else { return }
        secondVC.id = id
        secondVC.nickname = nickname
        
        self.present(secondVC, animated: true)
    }
    
    @objc func makenicknameButtonTapped() {
        let bottomSheetVC = ThirdViewController()
        bottomSheetVC.modalPresentationStyle = .pageSheet
        bottomSheetVC.transitioningDelegate = self
        
        let sheet = bottomSheetVC.sheetPresentationController
        sheet?.preferredCornerRadius = 30
        sheet?.prefersGrabberVisible = true
        sheet?.detents = [
            .custom { context in
                return context.maximumDetentValue * 0.55
            }]
        self.present(bottomSheetVC, animated: true)
    }
}

