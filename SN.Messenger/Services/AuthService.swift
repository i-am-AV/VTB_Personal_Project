//
//  AuthService.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 21.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import Foundation
import VK_ios_sdk

/**
 Интерфейс для делегирования работы сервиса авторизации
 */
protocol AuthServiceDelegate: class {
    func authServiceShouldShow(viewController: UIViewController)
    func authServiceSignIn()
    func authServiceSignInFailed()
}

final class AuthService: NSObject { //conforming NSObjectProtocol
    
    // MARK: - Constants
    
    private enum Constants {
        static let appId = "7559077"
        static let initializedSdk = "VKSdk initialized"
        static let scope = ["messages"]
        static let initialized = "User initialized"
        static let authorized = "User authorized"
    }
    
    // MARK: - Properties
    
    private let vkSdk: VKSdk
    weak var delegate: AuthServiceDelegate?
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: Constants.appId)
        super.init()
        print(Constants.initializedSdk)
        registerVkSdkDelegates()
    }
    
    // MARK: - Register method
    
    /**
     Функция для регистрации методов делегата.
     Вы можете зарегистрировать столько common делегатов, сколько необходимо, но UI делегат должен быть единственным.
     - authors: Alex Vasilyev
     */
    private func registerVkSdkDelegates() {
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    // MARK: - Session method
    
    /**
     Асинхронный метод для проверки доступности предыдущей сессии
     */
    func wakeUpSession() {
        VKSdk.wakeUpSession(Constants.scope) { (state, error) in
            switch state {
                
            case .initialized:
                print(Constants.initialized)
                VKSdk.authorize(Constants.scope) // авторизуем пользователя при инициализации
            case .authorized:
                print(Constants.authorized)
            default:
                fatalError(String(describing: error?.localizedDescription))
            }
        }
    }
}

// MARK: - VKSdk Delegates

extension AuthService: VKSdkDelegate, VKSdkUIDelegate {
    
    //Вызывается при успешной авторизации
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        delegate?.authServiceSignIn()
    }
    
    //Вызывается при неудачной авторизации
    func vkSdkUserAuthorizationFailed() {
        print(#function)
        delegate?.authServiceSignInFailed()
    }
    
    //Вызывается для показа контроллер авторизации. Принимает контроллре
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(viewController: controller)
    }
    
    //Вызывается, если нужно ввести капчу
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
