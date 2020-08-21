//
//  DataFetcher.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import Foundation

/**
 Интерфейс парсинга
 */
protocol DataFetcher {
    func getMessage(response: @escaping (MessageResponse?) -> ())
}
