//
//  NetworkDataFetcher.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import Foundation

/**
Реализация парсинга
*/

final class NetworkDataFetcher: DataFetcher {
    
    // MARK: - Properties
    
    private let networking: Networking
    
    // MARK: - Life cycle
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    // MARK: - Public Methods
    
    func getMessage(response: @escaping (MessageResponse?) -> ()) {
        let params = ["filter" : "all"]
        networking.request(path: API.pathToMessages, params: params) { (data, error) in
            if let error = error {
                print("Error recieved requesting data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: MessageResponseWrapped.self, from: data)
            response(decoded?.response)
        }
    }
    
    // MARK: - Private Methods
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
