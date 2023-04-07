//
//  FirstViewController.swift
//  sopt_1st_week
//
//  Created by 신지원 on 2023/04/01.
//

import UIKit

final class FirstViewController: UIViewController {
    //final을 쓰는 경우엔 더이상 오버라이드 하지 않아도 될 때 사용한다.
    
    private let nameLabel: UILabel = {
        //private let => private 선언된 괄호안에서만 가능하며 let 변경하지 않을 값
        
        let label = UILabel()
        //UILabel = A view that displays one or more lines of informational text. (출처:apple)
        //텍스트나 색 레이아웃등을 설정할 때 사용하는 class 다.
        
        label.text = "이름을 적어주세요"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label
        
    }()
    private let ageLabel: UILabel = {
        //private let => private 선언된 괄호안에서만 가능하며 let 변경하지 않을 값
        
        let label_2 = UILabel()
        //UILabel = A view that displays one or more lines of informational text. (출처:apple)
        //텍스트나 색 레이아웃등을 설정할 때 사용하는 class 다.
        
        label_2.text = "나이를 적어주세요"
        label_2.font = .systemFont(ofSize: 16)
        label_2.textColor = .blue
        label_2.textAlignment = .center
        return label_2
        
    }()
    
    private lazy var presentButton: UIButton = {
        //lazy var 은 지연 저장 프로퍼티이며이며 아래 클래스 내에 있는 요소들은 처음에 첫 번째 호출 때 초기화가 된다.
        
        let button = UIButton()
        //UIButton = A control that executes your custom code in response to user interactions. (출처:apple)
        
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        
        button.addTarget(self,
                         //addTarget의 파라미터에는 세 가지가 있는데,  target, action, controlEvents 가 그것이다.
                         //action은 event 발생했을 때, 그에 응답하여 호출될 method를 의미한다.
                         //이때 타겟은 self이며 아래 #selector에서 지정한 함수가 호출된다.
            
                         action: #selector(presentButtonTapped),
                         //위는 button의 event가 발생하였을 때 presentButtonTapped 의 방식을 호출한다는 것을 의미한다.
                         
                         for: .touchUpInside)
                         //위의 for는 'action for'로 함께 사용하며 target 오브젝트(for 뒤의 문장)와 action 메서드를 이어주는 함수다.
        
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.blue, for: .normal)
        
        button.addTarget(self,
                         action: #selector(pushButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private let nameTextField: UITextField = {
        //UITextField = An object that displays an editable text area in your interface. (출처:apple)
        
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요"
        //placeholder = Contains elements that are not directly evaluated by the template. (출처:apple)
        
        textField.clearButtonMode = .whileEditing
        //clearButtonMode = A mode that controls when the standard Clear button appears in the text field.(출처:apple)

        textField.layer.borderColor = UIColor.gray.cgColor
        //cgColor = A set of components that define a color, with a color space specifying how to interpret them. (출처:apple)
        //UIcolor 와 cgColor는 다른 것이며 각자 지정된 것으로 구분해서 사용해준다고 한다.
        //보통 cgColor를 사용하려면 UIcolor를 함께 사용해주어야 한다.
        
        textField.layer.borderWidth = 1
        return textField
    }()
    private let ageTextField: UITextField = {
        let ageField = UITextField()
        ageField.placeholder = "나이를 입력해주세요"
        ageField.clearButtonMode = .whileEditing
        ageField.layer.borderColor = UIColor.gray.cgColor
        ageField.layer.borderWidth = 1
        return ageField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //viewDidLoad 는 세미나에서 배웠던 것처럼 view가 로드되고 나서 가장 바로 시작되는 함수다.
        //주로 추가적인 초기화 작업을 구현하기 위해 오버라이딩되어 사용된다.
        
        style()
        setLayout()
        //따라서 위와 같은 함수를 호출하여 초기화 작업을 해준 것이다.
        
    }
}

private extension FirstViewController {
    
    func style() {
        
        view.backgroundColor = .white
        //백그라운드 색을 white로 선언하였다.
        
    }
    
    func setLayout() {
        //오잉 ;-;
        
        [nameLabel, nameTextField,
         presentButton, pushButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        
        [ageLabel, ageTextField,
         presentButton, pushButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([ageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     ageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20),
                                     ageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     ageTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    func presentToSecondViewController() {
        //present를 할 경우엔 창을 유지하여 다른 화면으로 넘어가고 위 아래로 창을 띄운다.
        
        let secondViewController = SecondViewController()
        guard let name = nameTextField.text else { return }
        //guard let은 뒤에 따라붙는 bool 타입의 값이 참일 경우 코드가 실행되고, 거짓이리 경우 else의 코드가 실행된다.
        //if let 구문과 달리 else문을 생략할 수 없다는 특징이 있다.
        
        secondViewController.name = name
        
        guard let age = ageTextField.text else { return }
        secondViewController.age = age
        
        secondViewController.modalPresentationStyle = .fullScreen
        //modalPresentationStyle이란 present 할때 사용 할수 있는 모달 프레젠테이션 스타일을 말한다.
        //modalPresentationStyle의 기본값은 원래 fullScreen인데, iOS 13부터 automatic 으로 바뀌었다고 한다. (차이점은 너무 어렵다,,)
        
        self.present(secondViewController, animated: true)
        //animated는 애니메이션과 관련있는 함수다.
    }
    
    func pushToSecondViewController() {
        //push를 할 경우엔 창을 위에 추가로 쌓으며 좌우로 창을 띄운다.
        
        let secondViewController = SecondViewController()
        guard let name = nameTextField.text else { return }
        secondViewController.name = name
        
        guard let age = ageTextField.text else { return }
        secondViewController.age = age
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
        //navigationController 는 스택 기반의 뷰 컨트롤러를 의미한다.
        //swift 에서 "?"는 nill(c언어에서 null)을 의미하며 값이 있을 수도, 없을 수도 있다는 것을 뜻한다.
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

