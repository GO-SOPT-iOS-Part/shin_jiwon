//
//  ViewController.swift
//  Seminar
//
//  Created by 신지원 on 2023/06/27.
//

import UIKit

final class ViewController: UIViewController {
    
    //라벨
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요!?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    //버튼
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        //⭐️버튼 터치
        button.addTarget(self,
                         action: #selector(presentButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    //버튼
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        //⭐️버튼 터치
        button.addTarget(self,
                         action: #selector(pushButtonTapped),
                         for: .touchUpInside)
        return button
        
    }()
    
    //텍스트필드
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
}

private extension ViewController {
    
    func setStyle() {
        
        view.backgroundColor = .white
    }
    
    //오토레이아웃으로 잡았다!
    func setLayout() {
        
        [nameLabel, nameTextField,
         presentButton, pushButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            //autoresizingMask 또한 superView 에 따라 크기를 변경하려 하기 때문에 AutoLayout 과 충돌 될 수 있어 autoresizingMask의 사용을 false 처리 한 것
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    func presentToSecondViewController() {
        
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true)
    }
    
    func pushToSecondViewController() {
        
        guard let name = nameTextField.text else { return }
        let secondViewController = SecondViewController()
        secondViewController.name = name
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    func presentButtonTapped() {
        
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped() {
        
        pushToSecondViewController()
        
    }
}


