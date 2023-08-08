//
//  HomeViewData.swift
//  Assignment
//
//  Created by 신지원 on 2023/08/06.
//

import UIKit

struct HomeContentView {
    let contentView : UIView
}

extension HomeContentView {
    static func dummyView() -> [HomeContentView] {
        let homeMainView = HomeMainView()
        let homeLiveView = HomeLiveView()
        let homeTVView = HomeTVView()
        let homeMovieView = HomeMovieView()
        let homeParaView = HomeParaView()
        let homeKidsView = HomeKidsView()
        
        return [HomeContentView(contentView: homeMainView),
                HomeContentView(contentView: homeLiveView),
                HomeContentView(contentView: homeTVView),
                HomeContentView(contentView: homeMovieView),
                HomeContentView(contentView: homeParaView),
                HomeContentView(contentView: homeKidsView)]
    }
}
