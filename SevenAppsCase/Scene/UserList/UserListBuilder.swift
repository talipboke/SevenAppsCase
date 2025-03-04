//
//  UserListBuilder.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit

enum UserListBuilder {
    static func build() -> UIViewController {
        let viewModel = UserListViewModel()
        return UserListViewController(viewModel: viewModel)
    }
}
