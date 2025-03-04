//
//  UserListBuilder.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit


protocol UserListBuilder {
    func build(coordinator: UserListCoordinator) -> UserListViewController
}

extension AppDependencies: UserListBuilder {
    func build(coordinator: UserListCoordinator) -> UserListViewController {
        let viewModel = UserListViewModel(userApi: makeUserAPI(), coordinator: coordinator)
        return UserListViewController(viewModel: viewModel)
    }
}
