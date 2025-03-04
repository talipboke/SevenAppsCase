//
//  UserDetailControllerTests.swift
//  SevenAppsCaseTests
//
//  Created by Talip on 5.03.2025.
//

import XCTest
@testable import SevenAppsCase

final class UserDetailControllerTests: XCTestCase {
    
    var sut: UserDetailController!
    
    override func setUp() {
        super.setUp()
        let mockUser = UserModel(name: "Talip", email: "talipboke13@gmail.com", phone: "1234", website: "https://github.com/talipboke")
        let viewModel = UserDetailViewModel(user: mockUser)
        sut = UserDetailController(viewModel: viewModel)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_ShouldSetupUI() {
        // Given
        let expectation = expectation(description: "SetupUI Expectation")
        // When
        _ = sut.view
        
        _ = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        
        // Then
        XCTAssertEqual(sut.userDetailView.nameLabel.text, "Talip")
        XCTAssertEqual(sut.userDetailView.emailLabel.text, "talipboke13@gmail.com")
        XCTAssertEqual(sut.userDetailView.phoneLabel.text, "1234")
        XCTAssertEqual(sut.userDetailView.websiteLabel.text, "https://github.com/talipboke")
    }
}
