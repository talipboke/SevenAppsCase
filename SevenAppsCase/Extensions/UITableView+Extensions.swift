//
//  UITableView+Extensions.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit

extension UITableView {
    final func register<T: UITableViewCell>(cellWithClass cell: T.Type) {
        register(T.self, forCellReuseIdentifier: cell.reuseIdentifier)
    }

    final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cell: T.Type = T.self) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cell.reuseIdentifier, for: indexPath) as? T else {
            fatalError("\(cell.reuseIdentifier) must register to TableView")
        }
        return cell
    }
}
