//
//  WeatherTableViewCell.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/15.
//

import UIKit

import SnapKit
import Then

class WeatherTableViewCell: UITableViewCell {

    static let identifier = "WeatherTableViewCell"
    private lazy var weatherImage = UIImageView()
    private let cityLabel = UILabel()
    private let temperLabel = UILabel()
    private let humidityLabel = UILabel()

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
        
        cityLabel.do {
            $0.font = UIFont.systemFont(ofSize: 30)
        }
        temperLabel.do {
            $0.font = UIFont.systemFont(ofSize: 15)
        }
        humidityLabel.do {
            $0.font = UIFont.systemFont(ofSize: 15)
        }

    }

    func setLayout() {

        [weatherImage, cityLabel, temperLabel, humidityLabel].forEach { contentView.addSubview($0) }
        
        weatherImage.snp.makeConstraints {
            $0.height.width.equalTo(80)
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(30)
        }
        cityLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(20)
        }
        temperLabel.snp.makeConstraints {
            $0.top.equalTo(cityLabel).offset(50)
            $0.trailing.equalTo(cityLabel).inset(10)
        }
        humidityLabel.snp.makeConstraints {
            $0.top.equalTo(temperLabel).offset(20)
            $0.trailing.equalTo(cityLabel).inset(10)
        }
    }
}
