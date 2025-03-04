//
//  AppDependencies.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit
import EasyNetwork

// MARK: - Permanent Dependencies
struct AppDependencies {
    let appConfig: AppConfig

    init(appConfig: AppConfig = AppConfig()) {
        self.appConfig = appConfig
    }
}
