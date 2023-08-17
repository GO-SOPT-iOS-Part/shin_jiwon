//
//  File.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/17.
//

import UIKit 

import RealmSwift

class CarrotRealm: Object {
    
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var product: String = ""
    @Persisted var place: String = ""
    @Persisted var time: String = ""
//    @Persisted var tradeStatus: Trade = .clear
    @Persisted var price: Int = 0
    
    convenience init(id: Int, product: String, place: String, time: String, price: Int) {
        self.init()
        self.id = id
        self.product = product
        self.place = place
        self.time = time
        self.price = price
    }
}
