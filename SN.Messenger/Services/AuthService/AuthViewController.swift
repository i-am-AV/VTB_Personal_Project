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
    private let signInButton: UIButton = {
        let button = UIButton()
        button.configurateSignInButton()
        button.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        authService = AppDelegate.shared().authService // получаем authService через AppDelegate, чтобы не создавать его 2 раза (в AppDelegate и здесь)
//        authService.wakeUpSession()
        view.addSubview(signInButton)
        setSignInButtonConstraints()
    }
    
    @objc private func signInPressed() {
        authService.wakeUpSession()
    }
    
    private func setSignInButtonConstraints() {
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
