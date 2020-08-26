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
    var avatarImageView: WebImageView { get }
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
    let avatarImageView: WebImageView = {
        let imageView = WebImageView()
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
    
    // MARK: Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(viewModel: MessageCellViewModel) {
        avatarImageView.set(imageURL: viewModel.avatarUrlString)
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
        
        customContentView.addSubview(dateLabel)
        setDateLabelConstraints()
        
        customContentView.addSubview(messageTextLabel)
        setMessageTextLabelConstraints()
        
        customContentView.addSubview(nameLabel)
        setNameLabelConstraints()
    }
}

extension VKMessagesCell {
    
    func setCustomContentViewConstraints() {
        NSLayoutConstraint.activate([
            customContentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            customContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            customContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            customContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
        ])
    }
    
    func setAvatarImageViewConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: customContentView.topAnchor),
            avatarImageView.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: customContentView.leadingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 92)
        ])
    }
    
    func setNameLabelConstraints() {
        nameLabel.setContentHuggingPriority(.required, for: .vertical)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: customContentView.topAnchor, constant: 8),
            nameLabel.bottomAnchor.constraint(equalTo: messageTextLabel.topAnchor, constant: -8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -8)
        ])
    }
    
    func setMessageTextLabelConstraints() {
        NSLayoutConstraint.activate([
            messageTextLabel.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor, constant: -8),
            messageTextLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            messageTextLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -8)
        ])
    }

    func setDateLabelConstraints() {
        dateLabel.setContentHuggingPriority(.required, for: .horizontal)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: customContentView.topAnchor, constant: 8),
            dateLabel.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor, constant: -8),
            dateLabel.trailingAnchor.constraint(equalTo: customContentView.trailingAnchor, constant: -8),
        ])
    }
}

