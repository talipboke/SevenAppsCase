//
//  UserListView.swift
//  SevenAppsCase
//
//  Created by Talip on 5.03.2025.
//

import UIKit

final class UserListView: UIView {
    lazy var tableView = makeTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func set(delegate: UITableViewDelegate) {
        tableView.delegate = delegate
    }
    
    func set(dataSource: UITableViewDataSource) {
        tableView.dataSource = dataSource
    }
}

private extension UserListView {
    func setupUI() {
        backgroundColor = .white
        
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func makeTableView() -> UITableView {
        let view = UITableView()
        view.register(cellWithClass: UserCell.self)
        return view
    }
}
