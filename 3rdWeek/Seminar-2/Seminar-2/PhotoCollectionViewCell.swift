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
            $0.tintColor = .clear
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
//        isTapped = photo.heartTapped
    }
}
