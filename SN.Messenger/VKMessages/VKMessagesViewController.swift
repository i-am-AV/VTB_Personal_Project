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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellId.rawValue)
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId.rawValue, for: indexPath)
        
        cell.textLabel?.text = "Index: \(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        interactor?.makeRequest(request: .getMessage)
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
