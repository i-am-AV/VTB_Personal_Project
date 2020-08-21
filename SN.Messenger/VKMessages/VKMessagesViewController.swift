//
//  VKMessagesViewController.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 21.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

final class VKMessagesViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        networkService.getMessages()
    }
}
