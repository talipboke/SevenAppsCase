//
//  AppDelegate.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        startApp()
        return true
    }
}

private extension AppDelegate {
    func startApp() {
        let controller = HomeViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
