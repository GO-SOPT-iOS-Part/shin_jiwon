//
//  SecondViewController.swift
//  sopt_1st_week
//
//  Created by 신지원 on 2023/04/01.
//

import UIKit

final class SecondViewController: UIViewController {
    
    var name: String?
    var age: String?

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "제 이름은요!"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label_2 = UILabel()
        label_2.text = "제 나이는요!"
        label_2.font = .boldSystemFont(ofSize: 20)
        return label_2
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        button.addTarget(self,
                         action: #selector(backButtonTapped),
                         for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
        dataBind()
    }
    
    func dataBind() {
        nameLabel.text = name
        ageLabel.text = age
        //데이터를 연결해주는 func이다.
        }
}

private extension SecondViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [ageLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.bottomAnchor.constraint(equalTo: ageLabel.topAnchor,constant: 500)])
        
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     ageLabel.bottomAnchor.constraint(equalTo: backButton.topAnchor,constant: 50)])
        
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    @objc
    func backButtonTapped() {
        
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}


