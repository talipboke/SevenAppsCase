//
//  UserListViewController.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit
import Combine

final class UserListViewController: UIViewController {
    private lazy var tableView = makeTableView()
    
    private var cancellables: Set<AnyCancellable> = []
    private var viewModel: UserListViewModelProtocol
    
    init(viewModel: UserListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observe()
        viewModel.onViewDidLoad()
    }
}

// MARK: - UI
private extension UserListViewController {
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func makeTableView() -> UITableView {
        let view = UITableView()
        view.register(cellWithClass: UserCell.self)
        view.dataSource = self
        return view
    }
}

private extension UserListViewController {
    func observe() {
        viewModel.userList.$value
            .receive(on: DispatchQueue.main).receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }.store(in: &cancellables)
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cell: UserCell.self)
        cell.configure(with: viewModel.userList.value[indexPath.row])
        return cell
    }
}
