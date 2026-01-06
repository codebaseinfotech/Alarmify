//
//  AppDelegate.swift
//  Alarmify
//
//  Created by iMac on 05/01/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setUpOnboarding()
        
        return true
    }

    func setUpOnboarding() {
        let home = AddNewAlarmVC()
        let homeNavigation = UINavigationController(rootViewController: home)
        homeNavigation.navigationBar.isHidden = true
        self.window?.rootViewController = homeNavigation
        self.window?.makeKeyAndVisible()
    }
    


}

