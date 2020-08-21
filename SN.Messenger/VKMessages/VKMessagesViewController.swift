//
//  VKMessagesViewController.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 21.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

final class VKMessagesViewController: UIViewController {

    // MARK: - Properties
    
    private let fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        fetcher.getMessage { messageResponse in
            guard let messageResponse = messageResponse else { return }
            messageResponse.items.map { messageItem in
                print(messageItem.lastMessage.text)
            }
        }
    }
}
