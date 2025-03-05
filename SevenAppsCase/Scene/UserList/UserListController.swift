//
//  UserListController.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit
import Combine

final class UserListController: UIViewController {
    private(set) lazy var userListView = UserListView()
    
    private var cancellables: Set<AnyCancellable> = []
    private var viewModel: UserListViewModelProtocol
    
    init(viewModel: UserListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        super.loadView()
        view = userListView
        setupTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observe()
        viewModel.onViewDidLoad()
    }
}

// MARK: - UI
private extension UserListController {
    func setupTableView() {
        userListView.set(delegate: self)
        userListView.set(dataSource: self)
    }
}

private extension UserListController {
    func observe() {
        viewModel.userList.$value
            .receive(on: DispatchQueue.main).receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.userListView.tableView.reloadData()
            }.store(in: &cancellables)
    }
}

// MARK: - UITableViewDataSource
extension UserListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cell: UserCell.self)
        cell.configure(with: viewModel.userList.value[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension UserListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.onTapCell(by: indexPath.row)
    }
}
