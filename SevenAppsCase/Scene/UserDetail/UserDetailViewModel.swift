//
//  UserDetailViewModel.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import Foundation

protocol UserDetailViewModelProtocol: AnyObject {
    var userState: ConsecutiveNonRepeatingState<UserModel> { get }
}

final class UserDetailViewModel: UserDetailViewModelProtocol {
    var userState: ConsecutiveNonRepeatingState<UserModel> = .init(initialValue: .init())
    
    init(user: UserModel) {
        userState.update(user)
    }
}


