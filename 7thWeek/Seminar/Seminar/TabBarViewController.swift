//
//  TabBarViewController.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/20.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {

        super.viewDidLoad()

        let carrotViewController = CarrotViewController()
        carrotViewController.tabBarItem = UITabBarItem(title: "Carrot", image: UIImage(systemName: "star.fill"), tag: 0)

        let likedViewController = LikedViewController()
        likedViewController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "star.fill"), tag: 1)

        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        setViewControllers([carrotViewController,  likedViewController].map{UINavigationController(rootViewController: $0)}, animated: false)
    }

}
