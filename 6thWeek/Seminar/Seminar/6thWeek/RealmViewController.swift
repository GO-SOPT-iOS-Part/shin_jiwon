//
//  RealmViewController.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/18.
//

import UIKit

import RealmSwift

class RealmViewController: UIViewController {
    
    var tasks: Results<CarrotRealm>!
    
    let localRealm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        let tasks = CarrotRealm(id: 0, product: "지원이", place: "서울시", time: "늦은오후", price: 10000)
        
        try! localRealm.write {
            localRealm.add(tasks)
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
}
