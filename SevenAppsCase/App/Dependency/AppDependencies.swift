//
//  AppDependencies.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit
import EasyNetwork

// MARK: - Permanent Dependencies
final class AppDependencies {
    let appConfig: AppConfig
    
    lazy var userRepository: UserRepositoryProtocol = {
        return UserRepository(userApi: makeUserAPI())
    }()
    
    init(appConfig: AppConfig = AppConfig()) {
        self.appConfig = appConfig
    }
}
