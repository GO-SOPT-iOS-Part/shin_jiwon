//
//  BaseViewController.swift
//  sopt_3rd_week
//
//  Created by 신지원 on 2023/04/22.
//

import UIKit

//쓰고싶은 기능이 있다면 baseVC에 넣어놓고 재사용하면 된다
class BaseViewController: UIViewController {
    
    // MARK: Properties
    
    lazy private(set) var className: String = {
      return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    // MARK: Initializing
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("DEINIT: \(className)")
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: UI
    
    /// Attributes (속성) 설정 메서드
    func setStyle() {
        
        view.backgroundColor = .white
    }
    
    /// Hierarchy, Constraints (계층 및 제약조건) 설정 메서드
    func setLayout() {}
   
}
