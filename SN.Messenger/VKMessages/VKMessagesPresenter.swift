//
//  VKMessagesPresenter.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright (c) 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

protocol VKMessagesPresentationLogic {
  func presentData(response: VKMessages.Model.Response.ResponseType)
}

class VKMessagesPresenter: VKMessagesPresentationLogic {
    
    // MARK: - Properties
    
  weak var viewController: VKMessagesDisplayLogic?
    private let dateFormatter: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter
    }()
    
    // MARK: - Public Methods
  
  func presentData(response: VKMessages.Model.Response.ResponseType) {
    switch response {
    
    case .presentMessage(let message):
        //форматируем данные для передачи во viewController
        let cells = message.items.map { (messageItem) in
            cellViewModel(from: messageItem, profiles: message.profiles ?? [])
        }
        let messageViewModel = MessageViewModel(cells: cells)
        viewController?.displayData(viewModel: .displayMessage(messageViewModel: messageViewModel))
    }
  }
    
    // MARK: - Private Methods
  
    private func cellViewModel(from messageItem: MessageItem, profiles: [Profile]) -> MessageViewModel.Cell {
        
        
        let profile = profiles.first { (profile) -> Bool in
            return profile.id == messageItem.conversation?.peer?.id
        }
        
        let photo = profile?.photo ?? messageItem.conversation?.chatSettings?.photo100
        let text = messageItem.lastMessage?.text != "" ? messageItem.lastMessage?.text : "Вложение"

        let date = Date(timeIntervalSince1970: Double((messageItem.lastMessage?.date)!))
        let dateTitle = dateFormatter.string(from: date)
        
        return MessageViewModel.Cell.init(avatarUrlString: photo ?? "https://vk.com/images/camera_100.png",
                                          name:  messageItem.conversation?.chatSettings?.title ?? profile?.name ?? "NAME",
                                          text: text ?? "Вложение",
                                          date: dateTitle)
    }
}
