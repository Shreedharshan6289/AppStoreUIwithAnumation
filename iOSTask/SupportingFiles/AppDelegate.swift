//
//  AppDelegate.swift
//  iOSTask
//
//  Created by Shreedharshan on 19/09/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let launch = UINavigationController(rootViewController: HomeVC())
        launch.interactivePopGestureRecognizer?.isEnabled = false
        launch.navigationBar.isHidden = true
        self.window?.rootViewController = launch
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

