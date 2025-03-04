//
//  UserModel.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import Foundation

struct UserModel: Decodable, Equatable {
    let name: String
    let email: String
    let phone: String
    let website: String
    
    init(name: String = "",
         email: String = "",
         phone: String = "",
         website: String = "") {
        self.name = name
        self.email = email
        self.phone = phone
        self.website = website
    }
}
