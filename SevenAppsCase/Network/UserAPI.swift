//
//  UserAPI.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import Foundation
import EasyNetwork

protocol UserAPIProtocol {
    func getUserList() async throws -> [UserModel]
}

struct UserAPI: UserAPIProtocol {
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol = NetworkManager()) {
        self.network = network
    }
    
    func getUserList() async throws -> [UserModel] {
        try await network.request(route: UserRouter.getUserList)
    }
}
