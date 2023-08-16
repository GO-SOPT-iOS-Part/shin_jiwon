//
//  FirstCollectionViewCell.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/09.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class FirstCell : UICollectionViewCell {

    private var imageURL: URL?
    private var movieImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellStyle()
        layout()
        print("⭐️")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellStyle() {
        contentView.addSubview(movieImage)
    }
    
    private func layout() {
        movieImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureCell(_ results: Results){
        imageURL = URL(string: "https://image.tmdb.org/t/p/original/" + (results.poster_path ?? "") ) ?? nil
        movieImage.kf.setImage(with: imageURL)
    }
}
