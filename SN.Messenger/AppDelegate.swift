//
//  AppDelegate.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 21.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import UIKit
import VK_ios_sdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Proreties
    
    var window: UIWindow?
    var authService: AuthService?
    
    // MARK: - Singleton
    
    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    // MARK: - Life cycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        authService = AuthService()
        authService?.delegate = self
        
        let navigationController = UINavigationController(rootViewController: AuthViewController())
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
    }
}

    // MARK: - AuthServiceDelegate

extension AppDelegate: AuthServiceDelegate {
    
    func authServiceShouldShow(viewController: UIViewController) {
        print(#function)
        window?.rootViewController?.show(viewController, sender: nil)
    }
    
    func authServiceSignIn() {
        print(#function)
        window?.rootViewController = UINavigationController(rootViewController: VKMessagesViewController())
    }
    
    func authServiceSignInFailed() {
        print(#function)
    }
}
