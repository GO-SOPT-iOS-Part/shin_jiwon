//
//  NicknameViewController.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/02.
//

import UIKit

import SnapKit
import Then

class NicknameViewController: UIViewController {
    
    private var inputNickcnameLabel = UILabel()
    private var nicknameTextField = UITextField()
    private var saveButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        view.addSubviews(inputNickcnameLabel, nicknameTextField, saveButton)
        view.backgroundColor = .white
        
        inputNickcnameLabel.then {
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
            
            $0.addTarget(self, action: #selector(textFieldStartChange), for: .editingChanged)
        }
        saveButton.then {
            $0.setTitle("저장하기", for: .normal)
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 14)
            $0.titleLabel?.textColor = .white
            $0.layer.backgroundColor = UIColor.label.cgColor
            $0.layer.cornerRadius = 3
            
            $0.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        inputNickcnameLabel.snp.makeConstraints() {
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
        let firstVC = LoginViewController()
        guard let nickname = nicknameTextField.text else { return }
        firstVC.nickname = nickname
        
        self.present(firstVC, animated: false)
    }
    
    @objc func textFieldStartChange() {
        if nicknameTextField.text?.isOnlyKorean() == true {
            saveButton.layer.backgroundColor = UIColor.tvingRed.cgColor
            saveButton.isEnabled = true
        }
        else {
            saveButton.layer.backgroundColor = UIColor.label.cgColor
            saveButton.isEnabled = false
        }
    }
}
