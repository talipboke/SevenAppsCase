//
//  UserListViewModel.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import Foundation

protocol UserListViewModelProtocol: AnyObject {
    var userList: ConsecutiveNonRepeatingState<[UserModel]> { get }
    func onViewDidLoad()
    func onTapCell(by index: Int)
}

final class UserListViewModel: UserListViewModelProtocol {
    var userList = ConsecutiveNonRepeatingState<[UserModel]>(initialValue: [])
    
    private let userApi: UserAPIProtocol
    private let coordinator: UserListCoordinator
    
    init(userApi: UserAPIProtocol,
         coordinator: UserListCoordinator) {
        self.userApi = userApi
        self.coordinator = coordinator
        coordinator.viewModel = self
    }
    
    func onViewDidLoad() {
        Task {
            await getUserList()
        }
    }
    
    func onTapCell(by index: Int) {
        coordinator.navigateToUserDetail(with: userList.value[index])
    }
}

private extension UserListViewModel {
    func getUserList() async {
        do {
            let list = try await userApi.getUserList()
            userList.update(list)
        } catch {
            // TODO: Will be handled
            print(error)
        }
    }
}
