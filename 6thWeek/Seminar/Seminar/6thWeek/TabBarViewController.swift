//
//  TabBatViewController.swift
//  Seminar
//
//  Created by 신지원 on 2023/08/18.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let carrotViewController = CarrotViewController()
        carrotViewController.tabBarItem = UITabBarItem(title: "Carrot", image: UIImage(systemName: "flame.fill"), tag: 0)
        
        let favoriteViewController = FavoriteViewController()
        favoriteViewController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "flame.fill"), tag: 1)
        
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
        setViewControllers([carrotViewController,  favoriteViewController].map{UINavigationController(rootViewController: $0)}, animated: false)
    }

}
