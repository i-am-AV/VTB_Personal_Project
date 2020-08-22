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
        case some
        case getMessage
      }
    }
    struct Response {
      enum ResponseType {
        case some
        case presentMessage
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayMessage
      }
    }
  }
  
}
