//
//  CarrotTableViewCell.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/01.
//

import UIKit

class CarrotTableViewCell: UITableViewCell {

    //재사용 Cell 을 등록하기 위하여 선언하는 식별자
    static let identifier = "CarrotTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            setStyle()
            setLayout()
        }
    
    //init 만 작성하면
    //required' initializer 'init(coder:)' must be provided by subclass of 'UITableViewCell'
    //와 같은 에러 발생하여 아래 required init 자동 생성
    
    //init(corder: _) 는 storyboard 상에서 초기화해주는 함수이고 init(frame: _) 는 코드 상에서 초기화해주는 함수
    //UIView & UIVC -> NSCoding 채택
    //NSCoding -> init(corder: _)채택
    //따라서 코드로 작성하지만 init(corder: _) 를 사용해야 한다. (required 를 이용하여 요청)
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        
    }
    
    func setLayout() {
        
    }
}
