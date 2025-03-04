//
//  HomeViewController.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension HomeViewController {
    func setupUI() {
        view.backgroundColor = .white
    }
}
