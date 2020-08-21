//
//  VKMessagesViewController.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 21.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

final class VKMessagesViewController: UIViewController {
    
    private let networkService: Networking = NetworkService()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        let params = ["filter" : "all"]
        networkService.request(path: API.pathToMessages, params: params) { (data, error) in
            if let error = error {
                print("Error recieved requesting data: \(error.localizedDescription)")
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let data = data else { return }
            let response = try? decoder.decode(MessageResponseWrapped.self, from: data)
            print(response)
            response?.response.items.map({ messageItem in
                print(messageItem.conversation)
            })
        }
    }
}
