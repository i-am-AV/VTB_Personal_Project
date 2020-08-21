//
//  NetworkService.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 21.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import Foundation

final class NetworkService {
    
    // MARK: - Properties
    
    private let authService: AuthService
    
    // MARK: - Life cycle
    
    init(authService: AuthService = AppDelegate.shared().authService!) {
        self.authService = authService
    }
    
    // MARK: - Public methods
    
    /**
    Публичный метод для получения сообщений
    */
    
    func getMessages() {
        var components = URLComponents()
        
        guard let allParams = getParams() else { return }
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.pathToMessages
        components.queryItems = allParams.map { URLQueryItem(name: $0, value: $1) } // Параметры
        
        let url = components.url
        print(url)
    }
    
    // MARK: - Private methods
    
    /**
     Приватный метод для получения параметров
     - returns: Опциональный словарь со строками в качестве ключей и значений
     */
    
    private func getParams() -> [String: String]? {
        
        guard let token = authService.token else { return nil }
        
        let params = ["filter": "all"]
        var allParams = params
        allParams["access_token"] = token
        allParams["v"] = API.version
        
        return allParams
    }
}
