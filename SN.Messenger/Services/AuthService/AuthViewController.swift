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
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.configurateHeaderLabel()
        
        return label
    }()
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.configurateAboutLabel()
        
        return label
    }()
    
    private let stackView: UIStackView  = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        authService = AppDelegate.shared().authService // получаем authService через AppDelegate, чтобы не создавать его 2 раза (в AppDelegate и здесь)
//        authService.wakeUpSession()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBlue
        view.addSubview(signInButton)
        setSignInButtonConstraints()
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(aboutLabel)
        setStackViewConstraints()
    }
    
    @objc private func signInPressed() {
        authService.wakeUpSession()
    }
    
    private func setSignInButtonConstraints() {
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
