//
//  VKMessagesCell.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

protocol CellUITypes {
    var customContentView: UIView { get }
    var avatarImageView: UIImageView { get }
    var nameLabel: UILabel { get }
    var messageTextLabel: UILabel { get }
    var dateLabel: UILabel { get }
    
}

protocol MessageCellViewModel {
    var avatarUrlString: String { get }
    var name: String { get }
    var text: String? { get }
    var date: String { get }
}

final class VKMessagesCell: UITableViewCell, CellUITypes {
    
    // MARK: Properties
    
    let customContentView: UIView = {
        let view = UIView()
        view.configurateCustomContentView()
        return view
    }()
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.configurateAvatarImageView()
        return imageView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.configurateNameLabel()
        return label
    }()
    let messageTextLabel: UILabel = {
        let label = UILabel()
        label.configurateMessageTextLabel()
        return label
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.configurateDateLabel()
        return label
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.configurateVerticalStackView()
        
        return stackView
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.configurateHorizontalStackView()
        
        return stackView
    }()
    
    // MARK: Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(viewModel: MessageCellViewModel) {
//        avatarImageView
        nameLabel.text = viewModel.name
        messageTextLabel.text = viewModel.text
        dateLabel.text = viewModel.date
    }
    
    // MARK: Setup
    
    private func setupCell() {
        self.addSubview(customContentView)
        setupCustomContentView()
    }
    
    private func setupCustomContentView() {
        setCustomContentViewConstraints()
        
        customContentView.addSubview(avatarImageView)
        setAvatarImageViewConstraints()
        
        customContentView.addSubview(horizontalStackView)
        setupHorizontalStackView()
        setHorizontalStackViewConstraints()
    }
    
    private func setupVerticalStackView() {
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(messageTextLabel)
    }
    
    private func setupHorizontalStackView() {
        setupVerticalStackView()
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(dateLabel)
    }
}

extension VKMessagesCell {
    
    func setCustomContentViewConstraints() {
        NSLayoutConstraint.activate([
            customContentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            customContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            customContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            customContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
        ])
    }
    
    func setAvatarImageViewConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: customContentView.topAnchor),
            avatarImageView.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: customContentView.leadingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 84)
        ])
    }
    
    func setHorizontalStackViewConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: customContentView.topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor, constant: -8),
            horizontalStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            horizontalStackView.trailingAnchor.constraint(equalTo: customContentView.trailingAnchor, constant: -8),
        ])
    }
}

