//
//  FacebookMessagesPresenter.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright (c) 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

protocol FacebookMessagesPresentationLogic {
  func presentData(response: FacebookMessages.Model.Response.ResponseType)
}

class FacebookMessagesPresenter: FacebookMessagesPresentationLogic {
  weak var viewController: FacebookMessagesDisplayLogic?
  
  func presentData(response: FacebookMessages.Model.Response.ResponseType) {
  
  }
  
}
