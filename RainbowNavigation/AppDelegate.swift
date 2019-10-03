//
//  AppDelegate.swift
//  RainbowNavigation
//
//  Created by Johnson on 2019/10/3.
//  Copyright © 2019 Johnson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor(white: 0.93, alpha: 1)
        
        let navigation = UINavigationController(rootViewController: ViewController())
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

