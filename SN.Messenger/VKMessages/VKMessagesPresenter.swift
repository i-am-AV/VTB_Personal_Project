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
    
    case .some:
        print(".some presenter")
        viewController?.displayData(viewModel: .some)
    case .presentMessage:
        print(".presentMessage presenter")
        viewController?.displayData(viewModel: .displayMessage)
    }
  }
  
}
