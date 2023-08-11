//
//  HomeOtherView.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/09.
//

import UIKit

class HomeLiveView: UIView {

    private var contentImage = UIImageView()
    private var boxLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func setStyle() {
        self.addSubviews(contentImage, boxLabel)
        contentImage.do {
            $0.image = UIImage(named: "LiveImage")
        }
        
        boxLabel.do {
            $0.backgroundColor = .black
        }
    }
    
    private func setLayout() {
        contentImage.snp.makeConstraints {
            $0.top.equalTo(boxLabel.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        boxLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(180)
            $0.width.equalToSuperview()
        }
    }
}

class HomeTVView: UIView {

    private var contentImage = UIImageView()
    private var boxLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func setStyle() {
        self.addSubviews(contentImage, boxLabel)
        contentImage.do {
            $0.image = UIImage(named: "TvImage")
        }
        
        boxLabel.do {
            $0.backgroundColor = .black
        }
    }
    
    private func setLayout() {
        contentImage.snp.makeConstraints {
            $0.top.equalTo(boxLabel.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        boxLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(180)
            $0.width.equalToSuperview()
        }
    }
}

class HomeMovieView: UIView {

    private var contentImage = UIImageView()
    private var boxLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func setStyle() {
        self.addSubviews(contentImage, boxLabel)
        contentImage.do {
            $0.image = UIImage(named: "MovieImage")
        }
        
        boxLabel.do {
            $0.backgroundColor = .black
        }
    }
    
    private func setLayout() {
        contentImage.snp.makeConstraints {
            $0.top.equalTo(boxLabel.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        boxLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(180)
            $0.width.equalToSuperview()
        }
    }
}

class HomeParaView: UIView {

    private var contentImage = UIImageView()
    private var boxLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func setStyle() {
        self.addSubviews(contentImage, boxLabel)
        contentImage.do {
            $0.image = UIImage(named: "ParaImage")
        }
        
        boxLabel.do {
            $0.backgroundColor = .black
        }
    }
    
    private func setLayout() {
        contentImage.snp.makeConstraints {
            $0.top.equalTo(boxLabel.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        boxLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(180)
            $0.width.equalToSuperview()
        }
    }
}

class HomeKidsView: UIView {
    
    private var contentImage = UIImageView()
    private var boxLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func setStyle() {
        self.addSubviews(contentImage, boxLabel)
        contentImage.do {
            $0.image = UIImage(named: "KidsImage")
        }
        
        boxLabel.do {
            $0.backgroundColor = .black
        }
    }
    
    private func setLayout() {
        contentImage.snp.makeConstraints {
            $0.top.equalTo(boxLabel.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        boxLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(180)
            $0.width.equalToSuperview()
        }
    }
}
