//
//  VKMessagesViewController.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 21.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

protocol VKMessagesDisplayLogic: class {
    func displayData(viewModel: VKMessages.Model.ViewModel.ViewModelData)
}

final class VKMessagesViewController: UIViewController, VKMessagesDisplayLogic {
    
    // MARK: - Constants
    
    private enum Constants: String {
        case cellId
    }
    
    // MARK: - Properties
    
    var interactor: VKMessagesBusinessLogic?
    var router: (NSObjectProtocol & VKMessagesRoutingLogic)?
    private let tableView = UITableView()
    
    // MARK: Setup
    
    /**
     Отвечает за сборку модуля
     */
    
    private func setup() {
        let viewController        = self
        let interactor            = VKMessagesInteractor()
        let presenter             = VKMessagesPresenter()
        let router                = VKMessagesRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(VKMessagesCell.self, forCellReuseIdentifier: Constants.cellId.rawValue)
        
        setTableViewConstraints()
    }
    
    private func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func displayData(viewModel: VKMessages.Model.ViewModel.ViewModelData) {
        switch viewModel {
            
        case .some:
            print(".some ViewController")
        case .displayMessage:
            print(".displayMessage ViewController")
        }
    }
}

extension VKMessagesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId.rawValue, for: indexPath) as? VKMessagesCell
        
        cell?.avatarImageView.backgroundColor = .red
        cell?.nameLabel.text = "Name Label"
        cell?.messageTextLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        cell?.dateLabel.text = "Date label"
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        interactor?.makeRequest(request: .getMessage)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}


//final class VKMessagesViewController: UIViewController, VKMessagesDisplayLogic {
//
//    // MARK: - Properties
//
//    private let fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
//
//    // MARK: - Life cycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemYellow
//        fetcher.getMessage { messageResponse in
//            guard let messageResponse = messageResponse else { return }
//            messageResponse.items.map { messageItem in
//                print(messageItem.lastMessage.text)
//            }
//        }
//    }
//}
