//
//  NetworkService.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 21.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import Foundation

final class NetworkService: Networking {
    
    // MARK: - Properties
    
    private let authService: AuthService
    
    // MARK: - Life cycle
    
    init(authService: AuthService = AppDelegate.shared().authService!) {
        self.authService = authService
    }
    
    // MARK: - Networking implementation
    
    func request(path: String, params: [String : String], completion: @escaping (Data?, Error?) -> Void) {

        let allParams = getAllParams(with: params)
        let url = self.url(from: path, params: allParams)
        print(url)
        
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume() // для запуска
    }
    
    // MARK: - Private methods
    
    private func getAllParams(with params: [String : String]) -> [String: String] {
        guard let token = authService.token else { return [:]}
        
        var allParams = params
        allParams["access_token"] = token
        allParams["v"] = API.version
        
        return allParams
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
    
    /**
    Приватный метод для получения url из метода и параметров запроса
    - parameter path: Путь метода
    - parameter params: Словарь параметров запроса
    */
    
    private func url(from path: String, params: [String: String]) -> URL {
        var components = URLComponents()
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.pathToMessages
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) } // Параметры
        
        return components.url!
        
    }
}
