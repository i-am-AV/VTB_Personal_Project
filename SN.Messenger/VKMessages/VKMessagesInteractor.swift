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
  private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
  
  func makeRequest(request: VKMessages.Model.Request.RequestType) {
    if service == nil {
      service = VKMessagesService()
    }
    
    switch request {
    
    case .getMessage:
        fetcher.getMessage { [weak self] (messageResponse) in
            guard let messageResponse = messageResponse else { return }
            self?.presenter?.presentData(response: .presentMessage(message: messageResponse))
        }
    }
    
  }
  
}
