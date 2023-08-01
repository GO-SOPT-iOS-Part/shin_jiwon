//
//  CarrotEnum.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/01.
//

import UIKit

struct Carrot {
    let image: UIImage
    let product: String
    let place: String
    let time: String
    let tradeStatus: Trade
    let price: Int
}

@frozen
enum Trade {
    case reservation
    case completed
    case shared
    case clear
    
    var title: String {
        switch self {
        case .reservation:
            return "예약중"
        case .completed:
            return "거래완료"
        case .shared:
            return "나눔완료"
        case .clear:
            return ""
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .reservation:
            return .systemGreen
        case .completed:
            return .black
        case .shared:
            return .gray
        case .clear:
            return .white
        }
    }
}
