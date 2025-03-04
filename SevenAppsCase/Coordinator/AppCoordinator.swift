//
//  AppCoordinator.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol] = []
    
    typealias Factory = CoordinatorFactoryProtocol
    private let factory: Factory

    init(navigationController: UINavigationController,
         factory: Factory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let userListController = factory.makeUserListCoordinator(navigationController)
        childCoordinators.removeAll()
        childCoordinators.append(userListController)
        userListController.start()
    }
}
