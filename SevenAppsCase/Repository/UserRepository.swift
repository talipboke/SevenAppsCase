//
//  UserRepository.swift
//  SevenAppsCase
//
//  Created by Talip on 5.03.2025.
//

import Foundation

protocol UserRepositoryProtocol {
    var userList: ConsecutiveNonRepeatingState<[UserModel]> { get }
    func getUserList() async throws
}

final class UserRepository: UserRepositoryProtocol{
    var userList = ConsecutiveNonRepeatingState<[UserModel]>(initialValue: [])
    
    private let userApi: UserAPIProtocol
    
    init(userApi: UserAPIProtocol) {
        self.userApi = userApi
    }
    
    func getUserList() async throws {
        await userList.update(try userApi.getUserList())
    }
}
