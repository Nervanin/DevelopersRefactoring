//
//  AppDelegate.swift
//  Devref
//
//  Created by Alexander Shalamov on 03/07/2018.
//  Copyright © 2018 Alexander Shalamov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let mainView = MenuViewController()
        let mainNavigationController = UINavigationController(rootViewController: mainView)
        mainNavigationController.viewControllers = [mainView]
        window?.rootViewController = mainNavigationController
        return true
    }
    
}
