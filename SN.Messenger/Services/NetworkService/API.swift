//
//  API.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 21.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import Foundation

enum API {
    static let scheme = "https" // Протокол
    static let host = "api.vk.com"// Название сайта
    static let pathToMessages = "/method/messages.getConversations" // Путь до метода
    static let version = "5.122" // Версия
}
