//
//  FacebookMessagesInteractor.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright (c) 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

protocol FacebookMessagesBusinessLogic {
  func makeRequest(request: FacebookMessages.Model.Request.RequestType)
}

class FacebookMessagesInteractor: FacebookMessagesBusinessLogic {

  var presenter: FacebookMessagesPresentationLogic?
  var service: FacebookMessagesService?
  
  func makeRequest(request: FacebookMessages.Model.Request.RequestType) {
    if service == nil {
      service = FacebookMessagesService()
    }
  }
  
}
