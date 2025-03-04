//
//  NetworkEndpointConfiguration.swift
//  EasyNetwork
//
//  Created by Talip on 22.03.2022.
//

import Foundation

public protocol NetworkEndpointConfiguration {
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [String: String] { get }
    var parametersBody: Data? { get }
    var timeoutInterval: TimeInterval { get }
}


