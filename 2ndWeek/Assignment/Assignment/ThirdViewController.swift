//
//  ThirdViewController.swift
//  Assignment
//
//  Created by 신지원 on 2023/07/04.
//

import UIKit

class ThirdViewController: UIViewController {

    private var inputnickcnameLabel = UILabel()
    private var nicknameTextField = UITextField()
    private var saveButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        view.addSubviews(inputnickcnameLabel, nicknameTextField, saveButton)
        view.backgroundColor = .white
        
        inputnickcnameLabel.then {
            $0.text = "닉네임을 입력해주세요"
            $0.textColor = .black
            $0.font = UIFont(name: "Pretendard-Bold", size: 23)
        }
        nicknameTextField.then {
            $0.placeholder = "ex) 신지원 짱"
            $0.setPlaceholder(color: .tvingGray2)
            $0.layer.backgroundColor = UIColor.tvingGray1.cgColor
            $0.textColor = .tvingGray4
            $0.font = UIFont(name: "Pretendard-Bold", size: 14)
            $0.addLeftPadding()
        }
        saveButton.then {
            $0.setTitle("저장하기", for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 14)
            $0.titleLabel?.textColor = .white
            $0.layer.backgroundColor = UIColor.tvingRed.cgColor
            $0.layer.cornerRadius = 3
            
            $0.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        inputnickcnameLabel.snp.makeConstraints() {
            $0.bottom.equalTo(nicknameTextField.snp.top).offset(-21)
            $0.leading.equalTo(nicknameTextField.snp.leading)
        }
        nicknameTextField.snp.makeConstraints(){
            $0.top.equalToSuperview().inset(93)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        saveButton.snp.makeConstraints() {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(214)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
    
    @objc func saveButtonTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("nickNameReceived"), object: nil, userInfo: ["nickname":"\(nicknameTextField.text)"])
        
        self.dismiss(animated: true)
    }
}
