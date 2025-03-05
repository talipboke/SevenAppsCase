//
//  UserListBuilder.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit

protocol UserListBuilder {
    func build(coordinator: UserListCoordinator) -> UserListController
}

extension AppDependencies: UserListBuilder {
    func build(coordinator: UserListCoordinator) -> UserListController {
        let viewModel = UserListViewModel(repository: userRepository, coordinator: coordinator)
        return UserListController(viewModel: viewModel)
    }
}
