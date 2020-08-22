//
//  FacebookMessagesViewController.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright (c) 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

protocol FacebookMessagesDisplayLogic: class {
  func displayData(viewModel: FacebookMessages.Model.ViewModel.ViewModelData)
}

class FacebookMessagesViewController: UIViewController, FacebookMessagesDisplayLogic {

  var interactor: FacebookMessagesBusinessLogic?
  var router: (NSObjectProtocol & FacebookMessagesRoutingLogic)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = FacebookMessagesInteractor()
    let presenter             = FacebookMessagesPresenter()
    let router                = FacebookMessagesRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func displayData(viewModel: FacebookMessages.Model.ViewModel.ViewModelData) {

  }
  
}
