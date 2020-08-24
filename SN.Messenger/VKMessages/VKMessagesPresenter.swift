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
    private let dateFormatter: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter
    }()
  
  func presentData(response: VKMessages.Model.Response.ResponseType) {
    switch response {
    
    case .presentMessage(let message):
        //форматируем данные для передачи во viewController
        let cells = message.items.map { (messageItem) in
            cellViewModel(from: messageItem, profiles: message.profiles ?? [], and: message.groups ?? [])
        }
        let messageViewModel = MessageViewModel(cells: cells)
        viewController?.displayData(viewModel: .displayMessage(messageViewModel: messageViewModel))
    }
  }
  
    private func cellViewModel(from messageItem: MessageItem, profiles: [Profile], and groups: [Group]) -> MessageViewModel.Cell {
        
//        let profile = self.profile(for: (messageItem.conversation?.peer?.id)!, of: (messageItem.conversation?.peer?.type)!,
//                                   profiles: profiles, groups: groups)
        
        let profile = profiles.first { (profile) -> Bool in
            return profile.id == messageItem.conversation?.peer?.id
        }
        
        let photo = profile?.photo ?? messageItem.conversation?.chatSettings?.photo100
        

        let date = Date(timeIntervalSince1970: Double((messageItem.lastMessage?.date)!))
        let dateTitle = dateFormatter.string(from: date)
        
        return MessageViewModel.Cell.init(avatarUrlString: photo ?? "https://vk.com/images/camera_100.png",
                                          name:  messageItem.conversation?.chatSettings?.title ?? profile?.name ?? "NAME",
                                          text: messageItem.lastMessage?.text ?? "Вложение",
                                          date: dateTitle)
    }
    
//    private func profile(for peerId: Int, of type: String, profiles: [Profile], groups: [Group]) -> Representable {
//        let profilesOrGroups: [Representable] = peerId >= 0 ? profiles : groups
//        print(profilesOrGroups)
//        let normalLocalId = localId >= 0 ? localId : -localId
//        print(normalLocalId)
//        let representable = profilesOrGroups.first { (representable) -> Bool in
//            representable.id == normalLocalId
//        }
//        print(representable)
//        return representable!
//    }
}
