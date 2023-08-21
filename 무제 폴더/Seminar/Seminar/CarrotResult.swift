//
//  User.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/20.
//

import Foundation

import RealmSwift

class CarrotResult: Object {
    
    @Persisted(primaryKey: true) var id: Int
    @Persisted var image: String
    @Persisted var product: String
    @Persisted var place: String
    @Persisted var time: String
    @Persisted var tradeStatus: String
    @Persisted var price: Int
    @Persisted var liked: Bool
    
    convenience init(id: Int, image: String, product: String, place: String, time: String, tradeStatus: String, price: Int, liked: Bool) {
        
        self.init()

        self.id = id
        self.image = image
        self.product = product
        self.place = place
        self.time = time
        self.tradeStatus = tradeStatus
        self.price = price
        self.liked = liked
    }
}
