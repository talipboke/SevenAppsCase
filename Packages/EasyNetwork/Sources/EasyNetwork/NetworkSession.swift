//
//  NetworkSession.swift
//  
//
//  Created by Talip on 3.06.2023.
//

import Foundation

public protocol NetworkSession {
    func requestData(with request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkSession {
    public func requestData(with request: URLRequest) async throws -> (Data, URLResponse) {
        return try await data(for: request)
    }
}
