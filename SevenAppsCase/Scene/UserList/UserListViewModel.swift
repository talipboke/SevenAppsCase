//
//  UserListViewModel.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import Foundation

protocol UserListViewModelProtocol {
    var userList: ConsecutiveNonRepeatingState<[UserModel]> { get }
    func onViewDidLoad()
}

final class UserListViewModel: UserListViewModelProtocol {
    var userList = ConsecutiveNonRepeatingState<[UserModel]>(initialValue: [])
    
    private let userApi: UserAPIProtocol
    
    init(userApi: UserAPIProtocol = UserAPI()) {
        self.userApi = userApi
    }
    
    func onViewDidLoad() {
        Task {
            await getUserList()
        }
    }
}

private extension UserListViewModel {
    func getUserList() async {
        do {
            let list = try await userApi.getUserList()
            userList.update(list)
        } catch {
            print(error)
        }
    }
}
