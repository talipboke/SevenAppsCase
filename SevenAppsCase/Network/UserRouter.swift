//
//  UserRouter.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import Foundation
import EasyNetwork

enum UserRouter: NetworkEndpointConfiguration {
    case getUserList
    
    var method: HTTPMethod {
        switch self {
        case .getUserList: return .get
        }
    }
    
    var path: String { return AppConfig.baseURL + "/users" }
    
    var headers: [String: String] { [:] }
    var parametersBody: Data? { nil }
    var timeoutInterval: TimeInterval { 60 }
}
