//
//  CarrotTableViewCell.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/01.
//

import UIKit

import SnapKit
import Then

class CarrotTableViewCell: UITableViewCell {
    
    var isTapped: Bool = false {
            didSet {
                tapped()
            }
        }
    
    var handler: (() -> (Void))?
    
    //재사용 Cell 을 등록하기 위하여 선언하는 식별자
    static let identifier = "CarrotTableViewCell"
    
    private lazy var carrotImage = UIImageView()
    private let productLabel = UILabel()
    private let placeLabel = UILabel()
    private let timeLabel = UILabel()
    private let reservationLabel = UILabel()
    private let priceLabel = UILabel()
    private let horizontalStackView = UIStackView()
    
    private let likeButton = UIButton()
    
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
        
        // separatorInset = 줄간격 없애기
        separatorInset.left = 0
        
        // selectionStyle = 터치시 색상 이벤트
        selectionStyle = .none
        
        carrotImage.do {
            $0.layer.cornerRadius = 5
        }
        
        productLabel.do {
            $0.font = UIFont.systemFont(ofSize: 12)
        }
        
        placeLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 11)
        }
        
        timeLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 11)
        }
        
        reservationLabel.do {
            $0.textAlignment = .center
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 11)
            $0.layer.cornerRadius = 3
        }
        
        priceLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 13)
        }
        
        horizontalStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 5
        }
        
        likeButton.do {
            $0.tintColor = .yellow
            $0.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        }
    }
    
    func setLayout() {
        
        [carrotImage, productLabel, placeLabel,
         timeLabel, horizontalStackView, likeButton]
            .forEach { contentView.addSubview($0) }
        
        [reservationLabel, priceLabel]
            .forEach { horizontalStackView.addArrangedSubview($0) }
        
        carrotImage.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        productLabel.snp.makeConstraints {
            $0.leading.equalTo(carrotImage.snp.trailing).offset(14)
            $0.top.equalToSuperview().inset(10)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(productLabel.self)
            $0.top.equalTo(productLabel.snp.bottom).offset(6)
        }
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(placeLabel.snp.trailing).offset(3)
            $0.top.equalTo(placeLabel.self)
        }
        
        reservationLabel.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(50)
        }
        
        horizontalStackView.snp.makeConstraints {
            $0.leading.equalTo(placeLabel.self)
            $0.top.equalTo(timeLabel.snp.bottom).offset(6)
            $0.height.equalTo(30)
        }
        
        likeButton.snp.makeConstraints() {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
    }
    
    func tapped() {
        let image = isTapped ? "star.fill" : "star"
            likeButton.setImage(UIImage(systemName: image), for: .normal)
    }
    
    @objc
    func likeButtonTapped() {
        handler?()
    }
    
    //CarrotData 를 뿌려주는 과정
    func configureCell(_ carrot: Carrot) {
        
        carrotImage.image = carrot.image
        productLabel.text = carrot.product
        placeLabel.text = carrot.place
        timeLabel.text = carrot.time
        
        reservationLabel.text = carrot.tradeStatus.title
        reservationLabel.backgroundColor = carrot.tradeStatus.backgroundColor
        
//        reservationLabel.isHidden = carrot.tradeStatus == .clear
        
        //뒤에서 세 번째 숫자에 ',' 써주기
        var price = String(carrot.price)
        price.insert(",", at: price.index(price.endIndex, offsetBy: -3))
        priceLabel.text = price + "원"
        
    }
}
