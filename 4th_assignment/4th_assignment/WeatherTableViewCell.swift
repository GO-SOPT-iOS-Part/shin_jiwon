//
//  WeatherCell.swift
//  TableViewPractice
//
//  Created by 신지원 on 2023/05/12.
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
        
        //font 만 지정해주면 된다. 글씨는 가져올거니까!
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
        
        /* 이거 안쓰는 이유는?
        view.addSubviews(
            ~~
        )*/
        
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
    
        
    func configureCell(_ weather: Weathers) {
        guard let icon = weather.weather.first?.icon else { return }
        let url = "http://openweathermap.org/img/wn/\(icon).png"
        print("🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰")
        print(url)
        weatherImage.kfSetImage(url: url)
        cityLabel.text = String(weather.name)
        temperLabel.text = "현재 온도 : " + String(weather.main.temp) + "°C"
        humidityLabel.text = "습도 : " + String(weather.main.humidity) + "%"
    }
    
}


