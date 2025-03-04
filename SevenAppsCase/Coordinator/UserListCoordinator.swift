//
//  HomeCoordinator.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit

final class UserListCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol] = []
    
    typealias Factory = UserListBuilder
    private let factory: Factory
    
    weak var viewModel: UserListViewModelProtocol?
    
    init(navigationController: UINavigationController,
         factory: Factory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.build(coordinator: self)
        navigationController.viewControllers = [controller]
    }
}
