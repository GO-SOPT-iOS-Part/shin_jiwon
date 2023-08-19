//
//  FavoriteTableViewCell.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/18.
//

import UIKit

import SnapKit
import Then

class FavoriteTableViewCell: UITableViewCell {
    
    static let identifier = "FavoriteTableViewCell"
    
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
        
        likeButton.do {
            $0.tintColor = .systemPink
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
    
    func configureCell(_ carrot: CarrotRealm) {
        
        carrotImage.image = UIImage(named: carrot.imageName)
        productLabel.text = carrot.product
        placeLabel.text = carrot.place
        timeLabel.text = carrot.time
        
        reservationLabel.text = carrot.tradeStatus
        switch carrot.tradeStatus {
        case ".reservation":
            reservationLabel.text = "예약중"
            reservationLabel.backgroundColor = .gray
        case ".completed":
            reservationLabel.text = "거래완료"
            reservationLabel.backgroundColor = .black
        case ".shared":
            reservationLabel.text = "나눔완료"
            reservationLabel.backgroundColor = .black
        case ".clear":
            reservationLabel.text = "거래중"
            reservationLabel.backgroundColor = .systemGreen
        default:
            reservationLabel.text = ""
        }
        
        var price = String(carrot.price)
        price.insert(",", at: price.index(price.endIndex, offsetBy: -3))
        priceLabel.text = price + "원"
        
    }
}
