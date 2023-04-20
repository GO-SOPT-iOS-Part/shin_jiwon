//
//  FirstViewController.swift
//  sopt_2nd_week_practice
//
//  Created by 신지원 on 2023/04/19.
//

import UIKit

import SnapKit
import Then
final class FirstViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    
    lazy var beforeButton = UIButton()
    private let titleLabel = UILabel()
    lazy var idtextfield = UITextField()
    
    //password 와 관련된 함수 시작
    lazy var passwordtextfield = UITextField()
    var eyeButton = UIButton(type: .custom)
    var clearButton = UIButton()
    //password 와 관련된 함수 끝
    
    lazy var loginButton = UIButton()
    private let sidebar = UIView()
    private let findidButton = UIButton()
    private let findpasswordButton = UIButton()
    private let noaccountLabel = UILabel()
    private let makeaccountButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setstyle()
        setLayout()
        
        //password 와 관련된 함수
        setpasswordshownimage()
        
        idtextfield.delegate = self
        passwordtextfield.delegate = self
        
    }
    
    //이걸 setstyle 로 빼고 싶었는데 func 은 어떻게 하는지 몰라서 냅다 위에 썼습니당
    //얘도 버튼으로 만들고 싶은데 ,,,
    private func setpasswordshownimage() { //구글링의 도움을 많이 받았습니다!
        
        eyeButton = UIButton.init(primaryAction: UIAction(handler: { [self]_ in
            //여기서는 then 을 쓸 수 없나요?
            passwordtextfield.isSecureTextEntry.toggle()
            self.eyeButton.isSelected.toggle()
        }))
        
        eyeButton.isHidden = true
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 14 //우측에 터치할 수 있는 버튼 공간 남겨둠
        eyeButton.setImage(UIImage(named: "noeye"), for: .normal)
        eyeButton.setImage((UIImage(named: "eye")), for: .selected)
        self.eyeButton.configuration = buttonConfiguration
        self.passwordtextfield.rightView = eyeButton
        self.passwordtextfield.rightViewMode = .always
    }
    
    
}

private extension FirstViewController {
    
    func setstyle() {
        view?.backgroundColor = .black
        
        beforeButton.then {
            $0.setImage(UIImage(named: "btn_before"), for: .normal)
        }
        titleLabel.then {
            $0.textColor = .tvinggray1
            $0.text = "TVING ID 로그인"
            $0.font = UIFont(name: "Pretendard-Medium", size: 23)
        }
        idtextfield.then {
            $0.placeholder = "아이디"
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
            $0.setPlaceholder(color: .tvinggray2)
            $0.textColor = .tvinggray2
            $0.layer.backgroundColor = UIColor.tvinggray4.cgColor
            $0.layer.cornerRadius = 3
            $0.addLeftPadding()
        }
        
        //password 와 관련된 함수
        passwordtextfield.then {
            $0.placeholder = "비밀번호"
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
            $0.setPlaceholder(color: .tvinggray2)
            $0.textColor = .tvinggray2
            $0.layer.backgroundColor = UIColor.tvinggray4.cgColor
            $0.layer.cornerRadius = 3
            $0.addLeftPadding()
            
            //처음에 비밀번호가 안보이게 감춤
            $0.isSecureTextEntry = true
            
            /*clear 버튼은 있지만 커스텀 할 수 없음 하하!
             $0.clearButtonMode = .always
             $0.clearsOnBeginEditing = true
             */
        }
        /*
         eyeButton.then {
         $0.setImage(UIImage(named: "noeye"), for: .normal)
         $0.setImage((UIImage(named: "eye")), for: .selected)
         eyeButton.isHidden = true
         }
         */
        clearButton.then {
            $0.setImage(UIImage(named: "x"), for: .normal)
            $0.isHidden = true
            $0.addTarget(self,
                         action: #selector(clearButtonTapped),
                         for: .touchUpInside)
            $0.isEnabled = false
        }
        //password 와 관련된 함수 끝
        
        loginButton.then {
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.tvinggray2, for: .normal)
            $0.layer.backgroundColor = UIColor.black.cgColor
            $0.layer.cornerRadius = 3
            $0.layer.borderColor = UIColor.tvinggray1.cgColor
            $0.layer.borderWidth = 1
            
            $0.addTarget(self,
                         action: #selector(loginButtonTapped),
                         for: .touchUpInside)
        }
        sidebar.then {
            $0.backgroundColor = .tvinggray4
        }
        findidButton.then {
            $0.setTitle("아이디 찾기", for: .normal)
            $0.setTitleColor(.tvinggray2, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        }
        findpasswordButton.then {
            $0.setTitle("비밀번호 찾기", for: .normal)
            $0.setTitleColor(.tvinggray2, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        }
        noaccountLabel.then {
            $0.textColor = .tvinggray3
            $0.text = "아직 계정이 없으신가요?"
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
            $0.layer.backgroundColor = UIColor.black.cgColor
        }
        makeaccountButton.then {
            $0.setTitle("닉네임 만들러가기", for: .normal)
            $0.setTitleColor(.tvinggray2, for: .normal)
            $0.layer.backgroundColor = UIColor.black.cgColor
            $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 14)
            $0.setUnderLine()
        }
        
    }
    
    func setLayout() {
        view.addSubviews(
            beforeButton,
            titleLabel,
            idtextfield,
            passwordtextfield,
            loginButton,
            sidebar,
            findidButton,
            findpasswordButton,
            noaccountLabel,
            makeaccountButton
        )
        passwordtextfield.addSubviews(clearButton)
        
        beforeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(65)
            $0.leading.equalToSuperview().inset(24)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(90)
        }
        idtextfield.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        passwordtextfield.snp.makeConstraints {
            $0.top.equalTo(idtextfield.snp.bottom).offset(7)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        /*
         eyeButton.snp.makeConstraints {
         $0.top.equalTo(clearButton)
         $0.leading.equalTo(clearButton.snp.trailing).offset(16)
         $0.height.width.equalTo(20)
         }
         */
        clearButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().inset(259)
            $0.height.width.equalTo(20)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordtextfield.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        sidebar.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(251)
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        findidButton.snp.makeConstraints {
            $0.top.equalTo(sidebar)
            $0.trailing.equalTo(sidebar).offset(-33)
        }
        findpasswordButton.snp.makeConstraints{
            $0.top.equalTo(sidebar)
            $0.leading.equalTo(sidebar).offset(36)
        }
        noaccountLabel.snp.makeConstraints{
            $0.top.equalTo(findidButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().inset(51)
            $0.height.equalTo(22)
        }
        makeaccountButton.snp.makeConstraints{
            $0.top.equalTo(noaccountLabel.snp.top)
            $0.leading.equalTo(noaccountLabel.snp.trailing).offset(17)
            $0.height.equalTo(22)
            $0.width.equalTo(128)
        }
    }
    
    func loginButtonController() {
        let secondVC = SecondViewController()
        guard let id = idtextfield.text else { return }
        secondVC.id = id
        /*
         secondVC.modalTransitionStyle = UIModalTransitionStyle.fullScreen
         위 문장에서 Type 'UIModalTransitionStyle' has no member 'fullScreen'라는 에러가 뜨기도 하고
         어차피 기본값이 fullscreen 이라고 해서 생략해주었다.
         */
        self.present(secondVC, animated: true)
    }
    
    @objc func loginButtonTapped() {
        loginButtonController()
        
    }
    
    func passwordButtonController() {
        let secondVC = SecondViewController()
        guard let password = passwordtextfield.text else { return }
        secondVC.password = password
        /*
         secondVC.modalTransitionStyle = UIModalTransitionStyle.fullScreen
         위 문장에서 Type 'UIModalTransitionStyle' has no member 'fullScreen'라는 에러가 뜨기도 하고
         어차피 기본값이 fullscreen 이라고 해서 생략해주었다.
         */
        self.present(secondVC, animated: true)
    }
    
    @objc func passwordButtonTapped() {
        passwordButtonController()
    }
    
    @objc private func clearButtonTapped() {
        passwordtextfield.text = ""
        loginButton.isEnabled = false
        clearButton.isHidden = true
    }
    
}





