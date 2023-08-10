//
//  HomeMainContentData.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/09.
//

import UIKit

struct MyContentView {
    let color : UIColor
}

extension MyContentView {
    static func dummy() -> [MyContentView] {
        return [MyContentView(color: .systemRed),
                MyContentView(color: .systemBlue),
                MyContentView(color: .systemGray),
                MyContentView(color: .systemPink),
                MyContentView(color: .systemBrown),
                MyContentView(color: .systemPurple)]
    }
}
