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
    
    var interactor: VKMessagesBusinessLogic?
    var router: (NSObjectProtocol & VKMessagesRoutingLogic)?
    private var messageViewModel = MessageViewModel(cells: [])
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
        
        interactor?.makeRequest(request: .getMessage)
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
        case .displayMessage(messageViewModel: let messageViewModel):
            self.messageViewModel = messageViewModel // записываем данные во ViewModel
            tableView.reloadData()
        }
    }
}

extension VKMessagesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageViewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId.rawValue, for: indexPath) as! VKMessagesCell
        let cellViewModel = messageViewModel.cells[indexPath.row]
        cell.set(viewModel: cellViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        interactor?.makeRequest(request: .getMessage)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
