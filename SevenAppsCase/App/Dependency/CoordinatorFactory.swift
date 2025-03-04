//
//  CoordinatorFactory.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit

// MARK: CoordinatorFactory
protocol CoordinatorFactoryProtocol {
    func makeAppCoordinator(_ navigationController: UINavigationController) -> AppCoordinator
    func makeUserListCoordinator(_ navigationController: UINavigationController) -> UserListCoordinator
}

extension AppDependencies: CoordinatorFactoryProtocol {
    func makeAppCoordinator(_ navigationController: UINavigationController) -> AppCoordinator {
        return AppCoordinator(navigationController: navigationController, factory: self)
    }

    func makeUserListCoordinator(_ navigationController: UINavigationController) -> UserListCoordinator {
        return UserListCoordinator(navigationController: navigationController, factory: self)
    }
}
