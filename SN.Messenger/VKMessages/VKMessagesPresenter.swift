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
  weak var viewController: VKMessagesDisplayLogic?
  
  func presentData(response: VKMessages.Model.Response.ResponseType) {
    switch response {
    
    case .presentMessage(let message):
        //форматируем данные для передачи во viewController
        let cells = message.items.map { (messageItem) in
            cellViewModel(from: messageItem)
        }
        let messageViewModel = MessageViewModel(cells: cells)
        viewController?.displayData(viewModel: .displayMessage(messageViewModel: messageViewModel))
    }
  }
  
    private func cellViewModel(from messageItem: MessageItem) -> MessageViewModel.Cell {
        return MessageViewModel.Cell.init(avatarUrlString: "",
                                          name: "messageItem.lastMessage.date",
                                          text: messageItem.lastMessage?.text ?? "NONE",
                                          date: "\(messageItem.lastMessage?.date ?? 0000)")
    }
    
}
