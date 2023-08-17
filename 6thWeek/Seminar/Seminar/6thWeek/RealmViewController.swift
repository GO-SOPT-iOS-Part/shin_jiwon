//
//  RealmViewController.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/18.
//

import UIKit

import RealmSwift

class RealmViewController: UIViewController {
    
    // Realm 에서 읽어온 데이터를 담을 배열 선언
    var tasks: Results<CarrotRealm>!
    
    // Realm 파일에 접근
    let localRealm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        let tasks = CarrotRealm(id: 0, product: "지원이", place: "서울시", time: "늦은오후", price: 10000)
        
        // 렘테이블에 내용을 추가
        try! localRealm.write {
            localRealm.add(tasks)
        }
        
        /*
        램테이블에서 특정 내용 삭제
        func deleteListData(index: Int) {
            let task = localRealm.objects(CarrotRealm.self)[index]
            try! localRealm.write {
                
            }
        }
        */
        
        /*
         각 스레드의 작업이 완료되었을 때 해당 스레드에서 사용한 Realm 인스턴스 해제
         localRealm.invalidate()
         */
        
        //default.realm 위치 호출
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
}
