//
//  ViewController.swift
//  Seminar-2
//
//  Created by 신지원 on 2023/08/01.
//

import UIKit

import SnapKit
import Then

struct Photo {
    let image: UIImage
    var heartTapped: Bool
}

extension Photo {
    static func dummy() -> [Photo] {
        var photos: [Photo] = []
        for number in 1...18 {
            photos.append(Photo(image: UIImage(named: "photo_\(number)")!,
                                heartTapped: false))
        }
        return photos + photos
    }
}

class PhotoViewController: UIViewController {

    private lazy var collectionView = UICollectionView(frame: .zero,
                                                      collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

