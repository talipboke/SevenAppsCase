//
//  NetworkSessionTests.swift
//  
//
//  Created by Talip on 3.06.2023.
//

import XCTest
@testable import EasyNetwork

final class NetworkSessionTests: XCTestCase {
    
    private var sut: NetworkManager!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_ShouldSuccessWhenGivenValidData() async throws {
        // Given
        let jsonData = "{\"name\": \"talip\"}".data(using: .utf8)
        let session = MockNetworkSession(data: jsonData)
        sut = NetworkManager(isLoggingEnabled: true, session: session)
        
        // When
        let response: BasicMockResponse = try await sut.request(route: BasicMockRouter.testRequest)
        
        // Then
        XCTAssertEqual(response.name, "talip")
    }
}

struct BasicMockResponse: Decodable {
    let name: String
}

enum BasicMockRouter: NetworkEndpointConfiguration {
    case testRequest
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "www.google.com"
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var parametersBody: Data? {
        return nil
    }
    
    var timeoutInterval: TimeInterval {
        return 1
    }
}
