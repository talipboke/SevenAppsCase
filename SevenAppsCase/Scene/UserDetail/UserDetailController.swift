//
//  UserDetailController.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit
import Combine

final class UserDetailController: UIViewController {
    private(set) lazy var userDetailView = UserDetailView()
    private var cancellables: Set<AnyCancellable> = []
    private var viewModel: UserDetailViewModelProtocol
    
    init(viewModel: UserDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        super.loadView()
        view = userDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observe()
    }
}

private extension UserDetailController {
    func observe() {
        viewModel.userState.$value
            .receive(on: DispatchQueue.main)
            .sink { [weak self] user in
                self?.userDetailView.configure(with: user)
            }.store(in: &cancellables)
    }
}
