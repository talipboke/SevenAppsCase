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
    private var coordinator: AppCoordinator?
    private lazy var dependencies = AppDependencies()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if !dependencies.appConfig.isRunningTests {
            startApp()
        }
        return true
    }
}

private extension AppDelegate {
    func startApp() {
        let navigationController = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        coordinator = dependencies.makeAppCoordinator(navigationController)
        coordinator?.start()
    }
}
