//
//  UserListCoordinator.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit

final class UserListCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol] = []
    
    typealias Factory = UserListBuilder & UserDetailBuilder
    
    weak var viewModel: UserListViewModelProtocol?
    private let factory: Factory
    
    init(navigationController: UINavigationController,
         factory: Factory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.build(coordinator: self)
        navigationController.viewControllers = [controller]
    }
    
    func navigateToUserDetail(with user: UserModel) {
        let controller = factory.build(user: user)
        navigationController.pushViewController(controller, animated: true)
    }
}
