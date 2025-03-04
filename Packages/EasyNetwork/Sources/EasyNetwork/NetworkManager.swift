//
//  NetworkManager.swift
//  EasyNetwork
//
//  Created by Talip on 22.03.2022.
//

import Foundation

public protocol NetworkProtocol {
    func request<T: Decodable>(route: NetworkEndpointConfiguration) async throws -> T
}

final public class NetworkManager: NetworkProtocol {
    private let isLoggingEnabled: Bool
    private let session: NetworkSession
    
    public init(isLoggingEnabled: Bool = true,
                session: NetworkSession = URLSession.shared) {
        self.isLoggingEnabled = isLoggingEnabled
        self.session = session
    }
    
    @available(macOS 10.15.0, *)
    public func request<T: Decodable>(route: NetworkEndpointConfiguration) async throws -> T {
        guard let url = URL(string: route.path) else { throw NetworkError.invalidUrl }
        
        var request = URLRequest(url: url)
        request.httpMethod = route.method.rawValue
        request.httpBody = route.parametersBody
        request.allHTTPHeaderFields = route.headers
        request.timeoutInterval = route.timeoutInterval
        
        let data = try await fetchData(with: request)
        return try decode(data)
    }
}

// MARK: Private Methods
private extension NetworkManager {
    func fetchData(with request: URLRequest) async throws -> Data {
        let (data, response) = try await session.requestData(with: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.requestFailed
        }
        
        if isLoggingEnabled { logJSONResponse(data: data) }
        return data
    }
    
    func decode<T: Decodable>(_ data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Decoding error: \(error)")
            throw NetworkError.invalidData
        }
    }
    
    func logJSONResponse(data: Data) {
        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
            print(String(decoding: jsonData, as: UTF8.self))
        } else {
            print("json data malformed")
        }
    }
}
