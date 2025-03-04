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
        window = UIWindow(frame: UIScreen.main.bounds)
        startApp()
        return true
    }
}

private extension AppDelegate {
    func startApp() {
        let navigationController = UINavigationController(rootViewController: UserListBuilder.build())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
