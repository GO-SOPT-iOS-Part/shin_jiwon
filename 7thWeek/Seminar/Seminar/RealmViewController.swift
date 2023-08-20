//
//  ViewController.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/20.
//

import UIKit

import RealmSwift

final class RealmViewController: UIViewController {
    
    let localRealm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task = CarrotResult(id: 7,
                               image: ".princess",
                               product: "쿠로미 예뿌죠?",
                               place: "쿠로미 나라",
                               time: "3월 28일",
                               tradeStatus: ".completed",
                               price: 1000000,
                               liked: false)
        
        try! localRealm.write {
            localRealm.add(task)
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
}
