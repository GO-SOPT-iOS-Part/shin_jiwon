//
//  CarrotTableViewCell.swift
//  sopt_3rd_week
//
//  Created by 신지원 on 2023/04/22.
//

import UIKit

import SnapKit
import Then

final class CarrotTableViewCell: UITableViewCell {
    
    static let identifier = "CarrotTableViewCell"
    
    private lazy var carrotImage = UIImageView()
    private let productLabel = UILabel()
    private let placeLabel = UILabel()
    private let timeLabel = UILabel()
    private let reservationLabel = UILabel()
    private let priceLabel = UILabel()
    private let horizontalStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        
        // 줄 간격 없애는 왼쪽 기준으로 0
        separatorInset.left = 0
        
        // 터치 시 클릭 이벤트, 색상 없애기
        selectionStyle = .none
        
        carrotImage.do {
            //$0.makeRounded(radius: 5)
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
            $0.textAlignment = .center //글자를 가운데에
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 11)
            //$0.makeRounded(radius: 3)
            $0.layer.cornerRadius = 5
        }
        
        priceLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 13)
        }
        
        horizontalStackView.do {
            $0.axis = .horizontal //축 //좌우로 쌓겠다
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 5
        }
    }
    
    func setLayout() {
        
        [carrotImage, productLabel, placeLabel,
         timeLabel, horizontalStackView]
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
    }
    
    func configureCell(_ carrot: Carrot) {
            
            carrotImage.image = carrot.image
            productLabel.text = carrot.product
            placeLabel.text = carrot.place
            timeLabel.text = carrot.time
            
                    // enum 프로퍼티에서 만든 프로퍼티에 return값에 따라 매칭
            reservationLabel.text = carrot.tradeStatus.title
            reservationLabel.backgroundColor = carrot.tradeStatus.backgroundColor

            reservationLabel.isHidden = carrot.tradeStatus == .clear

                    // endIndex에 접근해서 맨뒤 기준으로 3칸 앞에 있는 곳에 "," 추가
                    // 1000원 -> 1,000원
            var price = String(carrot.price)
            price.insert(",", at: price.index(price.endIndex, offsetBy: -3))
            priceLabel.text = price + "원"
        
        }
}
