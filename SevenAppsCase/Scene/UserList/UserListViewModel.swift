//
//  UserListViewModel.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import Foundation
import Combine

protocol UserListViewModelProtocol: AnyObject {
    var userList: ConsecutiveNonRepeatingState<[UserCellModel]> { get }
    func onViewDidLoad()
    func onTapCell(by index: Int)
}

final class UserListViewModel: UserListViewModelProtocol {
    private var cancellables: Set<AnyCancellable> = []
    var userList = ConsecutiveNonRepeatingState<[UserCellModel]>(initialValue: [])
    
    private let repository: UserRepositoryProtocol
    private let coordinator: UserListCoordinator
    
    init(repository: UserRepositoryProtocol,
         coordinator: UserListCoordinator) {
        self.repository = repository
        self.coordinator = coordinator
        coordinator.viewModel = self
        observe()
    }
    
    func onViewDidLoad() {
        Task {
            await getUserList()
        }
    }
    
    func onTapCell(by index: Int) {
        coordinator.navigateToUserDetail(with: repository.userList.value[index])
    }
}

private extension UserListViewModel {
    func observe() {
        repository.userList.$value
            .receive(on: DispatchQueue.global())
            .map { list in
                list.map { user in
                    UserCellModel(name: user.name, email: user.email)
                }
            }
            .sink { [weak self] list in
                self?.userList.update(list)
            }.store(in: &cancellables)
    }
    
    func getUserList() async {
        do {
            try await repository.getUserList()
        } catch {
            // TODO: Will be handled
            print(error)
        }
    }
}
