//
//  MypageData.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/02.
//

import UIKit

struct MyPage {
    let text: String
}

extension MyPage {
    
    static func dummy1() -> [MyPage] {
        return [MyPage(text: "이용권"),
                MyPage(text: "1:1 문의내역"),
                MyPage(text: "예약알림"),
                MyPage(text: "회원정보 수정"),
                MyPage(text: "프로모션 정보 수신 동의")]
    }
    
    static func dummy2() -> [MyPage] {
        return [MyPage(text: "공지사항"),
                MyPage(text: "이벤트"),
                MyPage(text: "고객센터"),
                MyPage(text: "티빙 알아보기")]
    }

}
