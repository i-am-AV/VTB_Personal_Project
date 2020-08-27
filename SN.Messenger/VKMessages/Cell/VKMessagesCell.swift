//
//  VKMessagesCell.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

final class VKMessagesCell: UITableViewCell, CellUITypes {
    
    // MARK: Properties
    
    let customContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let avatarImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 46
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .black
        
        return label
    }()
    
    let messageTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemGray
        label.numberOfLines = 2
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .systemGray
        label.textAlignment = .right
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
    
    // MARK: Setter
    
    func set(viewModel: MessageCellViewModel) {
        avatarImageView.set(imageURL: viewModel.avatarUrlString)
        nameLabel.text = viewModel.name
        messageTextLabel.text = viewModel.text
        dateLabel.text = viewModel.date
    }
    
    // MARK: Setup
    
    private func setupCell() {
        
        selectionStyle = .blue
        
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

    // MARK: Constraints

extension VKMessagesCell {
    
    private func setCustomContentViewConstraints() {
        NSLayoutConstraint.activate([
            customContentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            customContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            customContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            customContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
        ])
    }
    
    private func setAvatarImageViewConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: customContentView.topAnchor),
            avatarImageView.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: customContentView.leadingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 92)
        ])
    }
    
    private func setNameLabelConstraints() {
        nameLabel.setContentHuggingPriority(.required, for: .vertical)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: customContentView.topAnchor, constant: 8),
            nameLabel.bottomAnchor.constraint(equalTo: messageTextLabel.topAnchor, constant: -8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -8)
        ])
    }
    
    private func setMessageTextLabelConstraints() {
        NSLayoutConstraint.activate([
            messageTextLabel.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor, constant: -8),
            messageTextLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            messageTextLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -8)
        ])
    }

    private func setDateLabelConstraints() {
        dateLabel.setContentHuggingPriority(.required, for: .horizontal)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: customContentView.topAnchor, constant: 8),
            dateLabel.bottomAnchor.constraint(equalTo: customContentView.bottomAnchor, constant: -8),
            dateLabel.trailingAnchor.constraint(equalTo: customContentView.trailingAnchor, constant: -8),
        ])
    }
}

