//
//  UserDetailView.swift
//  SevenAppsCase
//
//  Created by Talip on 5.03.2025.
//

import UIKit

final class UserDetailView: UIView {
    lazy var nameLabel = makeNameLabel()
    lazy var emailLabel = makeEmailLabel()
    lazy var phoneLabel = makePhoneLabel()
    lazy var websiteLabel = makeWebsiteLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func configure(with model: UserModel) {
        nameLabel.text = model.name
        emailLabel.text = model.email
        phoneLabel.text = model.phone
        websiteLabel.text = model.website
    }
}

private extension UserDetailView {
    func setupUI() {
        backgroundColor = .white
        
        addSubview(nameLabel)
        addSubview(emailLabel)
        addSubview(phoneLabel)
        addSubview(websiteLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        websiteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: UIDimension.Spacing.xlarge),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: UIDimension.Spacing.medium),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -UIDimension.Spacing.medium),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: UIDimension.Spacing.small),
            emailLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: UIDimension.Spacing.medium),
            emailLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -UIDimension.Spacing.medium),
            
            phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: UIDimension.Spacing.small),
            phoneLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: UIDimension.Spacing.medium),
            phoneLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -UIDimension.Spacing.medium),
            
            websiteLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: UIDimension.Spacing.small),
            websiteLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: UIDimension.Spacing.medium),
            websiteLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -UIDimension.Spacing.medium)
        ])
    }
    
    func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .title1).pointSize, weight: .semibold)
        return label
    }
    
    func makeEmailLabel() -> UILabel {
        let label = UILabel()
        return label
    }
    
    func makePhoneLabel() -> UILabel {
        let label = UILabel()
        return label
    }
    
    func makeWebsiteLabel() -> UILabel {
        let label = UILabel()
        return label
    }
}
