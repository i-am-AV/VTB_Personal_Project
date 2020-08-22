//
//  VKMessagesInteractor.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright (c) 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

protocol VKMessagesBusinessLogic {
  func makeRequest(request: VKMessages.Model.Request.RequestType)
}

class VKMessagesInteractor: VKMessagesBusinessLogic {

  var presenter: VKMessagesPresentationLogic?
  var service: VKMessagesService?
  
  func makeRequest(request: VKMessages.Model.Request.RequestType) {
    if service == nil {
      service = VKMessagesService()
    }
    
    switch request {
    
    case .some:
        print(".some interactor")
        presenter?.presentData(response: .some)
    case .getMessage:
        print(".getMessage interactor")
        presenter?.presentData(response: .presentMessage)
    }
  }
  
}
