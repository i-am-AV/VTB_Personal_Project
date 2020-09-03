//
//  VKMessagesModels.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright (c) 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

enum VKMessages {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getMessage
      }
    }
    struct Response {
      enum ResponseType {
        case presentMessage(message: MessageResponse)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayMessage(messageViewModel: MessageViewModel)
      }
    }
  }
}

struct MessageViewModel {
    struct Cell: MessageCellViewModel {
        var avatarUrlString: String
        var name: String
        var text: String?
        var date: String
    }
    
    var cells: [Cell]
}
