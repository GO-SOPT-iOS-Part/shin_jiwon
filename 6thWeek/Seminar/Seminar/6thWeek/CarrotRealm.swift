//
//  File.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/17.
//

import UIKit 

import RealmSwift

class CarrotRealm: Object {
    
    @Persisted(primaryKey: true) var _id : ObjectId
    @Persisted var imageName : String = ""
    @Persisted var product: String = ""
    @Persisted var place: String = ""
    @Persisted var time: String = ""
    @Persisted var tradeStatus: String = ""
    @Persisted var price: Int = 0
    
    convenience init(id: Int, imageName: String, product: String, place: String, time: String, tradeStatus: String, price: Int) {
        
        self.init()
        
        self.imageName = imageName
        self.product = product
        self.place = place
        self.time = time
        self.tradeStatus = tradeStatus
        self.price = price
    }
}
