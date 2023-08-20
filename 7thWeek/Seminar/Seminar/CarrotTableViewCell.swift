//
//  CarrotTableViewCell.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/20.
//

import UIKit

import SnapKit
import Then
import RealmSwift

class CarrotTableViewCell: UITableViewCell {
    
    //재사용 Cell 을 등록하기 위하여 선언하는 식별자
    static let identifier = "CarrotTableViewCell"
    
    private lazy var carrotImage = UIImageView()
    private let productLabel = UILabel()
    private let placeLabel = UILabel()
    private let timeLabel = UILabel()
    private let reservationLabel = UILabel()
    private let priceLabel = UILabel()
    private let horizontalStackView = UIStackView()
    private let likedButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {

        separatorInset.left = 0
        
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
        
        likedButton.do {
            $0.tintColor = .systemGreen
            $0.setImage(UIImage(systemName: "star"), for: .normal)
            $0.setImage(UIImage(systemName: "star.fill"), for: .selected)
//            $0.addTarget(self, action: #selector(likedButtonTapped), for: .touchUpInside)
        }
    }
    
    func setLayout() {
        
        [productLabel, placeLabel,
         timeLabel, horizontalStackView, carrotImage, likedButton]
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
            $0.top.equalToSuperview().inset(30)
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
        
        likedButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(30)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(30)
        }
    }
    
    //CarrotData 를 뿌려주는 과정
    func configureCell(_ carrot: CarrotResult) {
        
        carrotImage.image = UIImage(named: "princess")
        
//        Realm 에 이미지 이름을 ".princess" 로 입력하여 구현되지 않았습니다,,
//        carrotImage.image = UIImage(named: "\(carrot.image)")
        
        productLabel.text = carrot.product
        placeLabel.text = carrot.place
        timeLabel.text = carrot.time
        
        reservationLabel.text = carrot.tradeStatus
                switch carrot.tradeStatus {
                case ".completed" :
                    reservationLabel.text = "예약 완료"
                    reservationLabel.backgroundColor = .black
                case ".reservation" :
                    reservationLabel.text = "예약중"
                    reservationLabel.backgroundColor = .systemGreen
                case ".shared" :
                    reservationLabel.text = "나눔 완료"
                    reservationLabel.backgroundColor = .gray
                default :
                    reservationLabel.text = "거래중"
                    reservationLabel.backgroundColor = .systemPink
                }
        
        var price = String(carrot.price)
        var i = 3
        while price.count > i {
            price.insert(",", at: price.index(price.endIndex, offsetBy: -i))
            i += 4
        }
        priceLabel.text = price + "원"
        
    }
}
