//
//  ReuseIdentifier.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit

protocol ReuseIdentifiable: AnyObject {
  static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

extension UITableViewCell: ReuseIdentifiable {}
extension UICollectionViewCell: ReuseIdentifiable {}
