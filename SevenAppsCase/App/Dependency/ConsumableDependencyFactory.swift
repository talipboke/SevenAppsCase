//
//  ConsumableDependencyFactory.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import Foundation
import EasyNetwork

// MARK: Consumable DependencyFactory
protocol ConsumableDependencyFactoryProtocol {
    func makeNetworkClient() -> NetworkProtocol
    func makeUserAPI() -> UserAPIProtocol
}

extension AppDependencies: ConsumableDependencyFactoryProtocol {
    func makeNetworkClient() -> NetworkProtocol {
        return NetworkManager()
    }
    
    func makeUserAPI() -> UserAPIProtocol {
        return UserAPI(network: makeNetworkClient())
    }
}
