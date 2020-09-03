//
//  VKMessagesViewController.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 21.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import UIKit
import CoreData

protocol VKMessagesDisplayLogic: class {
    func displayData(viewModel: VKMessages.Model.ViewModel.ViewModelData)
}

final class VKMessagesViewController: UIViewController, VKMessagesDisplayLogic {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cellId = "messagesCellId"
        static let title = "VK chat"
        static let topInset: CGFloat = 8
        static let cellHeight: CGFloat = 100
    }
    
    // MARK: - Properties
    
    var interactor: VKMessagesBusinessLogic?
    var router: (NSObjectProtocol & VKMessagesRoutingLogic)?
    private var messageViewModel = MessageViewModel(cells: [])
    private let context = CoreDataStack.shared.persistentContainer.viewContext
    private let tableView = UITableView()
    private var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshMesseges), for: .valueChanged)
        
        return refreshControl
    }()
    
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
    
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Constants.title
        
        setup()
        setupTableView()
        
        interactor?.makeRequest(request: .getMessage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if messageViewModel.cells.isEmpty {
            loadViewModel()
        }
    }
    // MARK: - TableView
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.contentInset.top = Constants.topInset
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.addSubview(refreshControl)
        
        tableView.register(VKMessagesCell.self, forCellReuseIdentifier: Constants.cellId)
        
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
    
    // MARK: - RefreshControl
    
    @objc private func refreshMesseges() {
        interactor?.makeRequest(request: .getMessage)
    }
    
    // MARK: - DisplayData
    
    func displayData(viewModel: VKMessages.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayMessage(messageViewModel: let messageViewModel):
            self.messageViewModel = messageViewModel // записываем данные во ViewModel
            saveMessages(viewModel: messageViewModel)
            tableView.reloadData()
            refreshControl.endRefreshing()
        }
    }
}

    // MARK: - TableView DataSource & Delegate

 extension VKMessagesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageViewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath) as! VKMessagesCell
        let cellViewModel = messageViewModel.cells[indexPath.row]
        cell.set(viewModel: cellViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        tableView.deselectRow(at: indexPath, animated: true)
        interactor?.makeRequest(request: .getMessage)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }
}
    
    // MARK: - CoreData Implementation

extension VKMessagesViewController: CoreDataProtocol {
    func saveMessages(viewModel: MessageViewModel) {
        guard let entity = NSEntityDescription.entity(forEntityName: "Message", in: context) else { return }
        for cell in viewModel.cells {
            let messageObject = Message(entity: entity, insertInto: context)
            
            messageObject.name = cell.name
            messageObject.text = cell.text
            messageObject.date = cell.date
            messageObject.photo = cell.avatarUrlString
            
            print("Сохранен объект", messageObject)
        }
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadViewModel() {
        let fetchRequest: NSFetchRequest<Message> = Message.fetchRequest()
        
        do {
            let messages = try context.fetch(fetchRequest)
            var localViewModel = MessageViewModel(cells: [])
            for message in messages {
                if let name = message.name,
                    let text = message.text,
                    let date = message.date,
                    let photo = message.photo {
                    localViewModel.cells.append(MessageViewModel.Cell(avatarUrlString: photo, name: name, text: text, date: date))
                }
            }
            messageViewModel = localViewModel
            print("Loaded ViewModel", messageViewModel)
        } catch {
            print(error.localizedDescription)
        }
    }
}
