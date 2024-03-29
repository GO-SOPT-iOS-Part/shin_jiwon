//
//  PhotoCollectionViewCell.swift
//  Seminar-2
//
//  Created by 신지원 on 2023/08/01.
//

import UIKit

import SnapKit
import Then

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var isTapped: Bool = false {
        didSet {
            updateButton()
        }
    }
    
    //Closure 를 저장할 수 있는 Optional Stored Property
    //하트버튼이 tap 되면 tap 의 유무를 closure 에 넘겨준다.
    var handler: (() -> (Void))?
    
    static let identifier = "PhotoCell"
    
    let photoImage = UIImageView()
    let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        button.do {
            $0.tintColor = .white
            $0.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        }
    }
    
    func setLayout() {
        
        contentView.addSubview(photoImage)
        contentView.addSubview(button)
        
        photoImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(5)
            $0.size.equalTo(30)
        }
    }
    
    
    func configureCell(_ photo: Photo) {
        
        photoImage.image = photo.image
        isTapped = photo.heartTapped
    }
    
    func updateButton() {
        let image = isTapped ? "heart.fill" : "heart"
        button.setImage(UIImage(systemName: image), for: .normal)
    }
    
    @objc
    func heartButtonTapped() {
        handler?()
    }
}
