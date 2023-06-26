//
//  AppDelegate.swift
//  Seminar
//
//  Created by 신지원 on 2023/06/27.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
//  ⭐️ StoryBoard 연결 해제하고 화면을 변경해주는 코드 ⭐️
    var window: UIWindow?
        
        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            
        // 1.
            guard let windowScene = (scene as? UIWindowScene) else { return }
        // 2.
            self.window = UIWindow(windowScene: windowScene)
        // 3.
            let navigationController = UINavigationController(rootViewController: ViewController())
            self.window?.rootViewController = navigationController
        // 4.
            self.window?.makeKeyAndVisible()
        }
    
//  ⭐️⭐️

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

