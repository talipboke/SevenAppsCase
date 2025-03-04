//
//  UserDetailBuilder.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import Foundation

protocol UserDetailBuilder {
    func build(user: UserModel) -> UserDetailController
}

extension AppDependencies: UserDetailBuilder {
    func build(user: UserModel) -> UserDetailController {
        let viewModel = UserDetailViewModel(user: user)
        return UserDetailController(viewModel: viewModel)
    }
}
