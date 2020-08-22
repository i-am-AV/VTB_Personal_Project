//
//  VKMessagesCell.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

final class VKMessagesCell: UITableViewCell {
    
    //MARK: Properties
    
    //MARK: Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup
    
    private func setupCell() {
        
    }
}
