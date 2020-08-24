//
//  WebImageView.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 24.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

final class WebImageView: UIImageView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cache = "Loaded from cache"
        static let internet = "Loaded from internet"
    }
    
    // MARK: - Public Methods
    
    func set(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        
        if let cacheResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cacheResponse.data)
            print(Constants.cache)
            return
        }
        
        print(Constants.internet)
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.image = UIImage(data: data)
                    self?.handleLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    // MARK: - Private Methods
    
    /**
        Сохранение изображения в кеш
     - parameter data: Принимает данные в формате Data
     - parameter response: Принимает запрос в формате URLResponse
     
     */
    private func handleLoadedImage(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
    }
}
