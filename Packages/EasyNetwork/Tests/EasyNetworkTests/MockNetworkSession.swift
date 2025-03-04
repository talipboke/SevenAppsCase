//
//  File.swift
//  
//
//  Created by Talip on 3.06.2023.
//

import Foundation
@testable import EasyNetwork

final class MockNetworkSession: NetworkSession {
    private let data: Data?
    private let error: Error?
    private let response: URLResponse?
    
    init(data: Data? = nil,
         error: Error? = nil,
         response: URLResponse? = nil) {
        self.data = data
        self.error = error
        self.response = response ?? HTTPURLResponse(url: URL(string: "www.google.com")!,
                                                            statusCode: 200,
                                                            httpVersion: nil,
                                                            headerFields: nil)
    }
    
    func requestData(with request: URLRequest) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        guard let data = data, let response = response else {
            throw NetworkError.invalidData
        }
        return (data, response)
    }
}
