//
//  CellProtocols.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 26.08.2020.
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
