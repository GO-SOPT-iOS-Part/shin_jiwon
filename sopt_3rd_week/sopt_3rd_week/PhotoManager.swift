//
//  PhotoManager.swift
//  sopt_3rd_week
//
//  Created by 신지원 on 2023/04/22.
//

import UIKit

// 구조체
struct Photo {
    let image: UIImage
    var heartTapped: Bool
}

extension Photo {
    static func dummy() -> [Photo] {
        var photos: [Photo] = []
        for number in 1...12 {
            photos.append(Photo(image: UIImage(named: "photo_\(number)")!,
                                heartTapped: false))
        }
        return photos + photos
    }
}

