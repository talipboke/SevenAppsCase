//
//  AppConfig.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import Foundation

// TODO: Must be handled on configuration files with related app target
struct AppConfig {
    static let baseURL = "https://jsonplaceholder.typicode.com"
    
    var isRunningTests: Bool {
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
}
