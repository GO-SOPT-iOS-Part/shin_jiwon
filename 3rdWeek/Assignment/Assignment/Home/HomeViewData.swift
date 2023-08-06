//
//  HomeViewData.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/06.
//

import UIKit

struct HomeColor {
    let exColor : UIColor
}

extension HomeColor {
    
    static func dummyColor() -> [HomeColor] {
        return [HomeColor(exColor: UIColor.systemRed),
                HomeColor(exColor: UIColor.systemBlue),
                HomeColor(exColor: UIColor.systemCyan),
                HomeColor(exColor: UIColor.systemPink),
                HomeColor(exColor: UIColor.systemGray),
                HomeColor(exColor: UIColor.systemBrown)]
    }
}
