//
//  UserCell.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import UIKit

final class UserCell: UITableViewCell {
    private lazy var nameLabel = makeNameLabel()
    private lazy var emailLabel = makeEmailLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func configure(with model: UserModel) {
        nameLabel.text = model.name
        emailLabel.text = model.email
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        emailLabel.text = nil
    }
}

private extension UserCell {
    func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(nameLabel)
        addSubview(emailLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIDimension.Spacing.medium),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: UIDimension.Spacing.medium),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIDimension.Spacing.medium),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: UIDimension.Spacing.xsmall),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIDimension.Spacing.medium),
            emailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIDimension.Spacing.medium),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIDimension.Spacing.medium)
        ])
    }
    
    func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .body).pointSize, weight: .semibold)
        return label
    }
    
    func makeEmailLabel() -> UILabel {
        let label = UILabel()
        return label
    }
}
