//
//  AuthViewController.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 21.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import UIKit
import VK_ios_sdk

final class AuthViewController: UIViewController {
    
    // MARK: Properties
    
    private var authService: AuthService!
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        authService = AppDelegate.shared().authService // получаем authService через AppDelegate, чтобы не создавать его 2 раза (в AppDelegate и здесь)
        authService.wakeUpSession()
    }
    
}
