//
//  HomeTabBarCollectionViewCell.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/03.
//

import UIKit

import SnapKit
import Then

struct MyList {
    let text: String
}

extension MyList {
    
    static func dummy() -> [MyList] {
        return [MyList(text: "홈"),
                MyList(text: "실시간"),
                MyList(text: "TV프로그램"),
                MyList(text: "영화"),
                MyList(text: "파라마운트+"),
                MyList(text: "키즈")]
    }
}

