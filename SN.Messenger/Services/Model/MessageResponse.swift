//
//  MessageResponse.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 21.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import Foundation

struct MessageResponseWrapped: Decodable {
    let response: MessageResponse?
}

/**
 Список бесед пользователя
 - count: Число результатов
 - items: Беседы
 - unreadCount: Число непрочитанных бесед
 */

struct MessageResponse: Decodable {
    let count: Int?
    let items: [MessageItem]
    let unreadCount: Int?
    let profiles: [Profile]?
    let groups: [Group]?
}

/**
 Беседа
 - conversation: Объект беседы
 - lastMessage: Объект, описывающий последнее сообщение в беседе
 */

struct MessageItem: Decodable {
    let conversation: Conversation?
    let lastMessage: LastMessage?
}

/**
 Профиль
 - id: Идентификатор пользователя
 - firstName: Имя
 - lastName: Фамилия
 - deactivated: Поле возвращается, если страница пользователя удалена или заблокирована, содержит значение deleted или banned. В этом случае опциональные поля не возвращаются
 - isClosed: Скрыт ли профиль пользователя настройками приватности
 - canAccessClosed: может ли текущий пользователь видеть профиль при is_closed = 1
 */

struct Profile: Decodable {
    let id: Int?
    let firstName: String?
    let lastName: String?
    let deactivated: String?
    let isClosed: Bool?
    let canAccessClosed: Bool?
}

/**
 Группа
 - id: Идентификатор сообщества
 - name: Название сообщества
 - screenName: Короткий адрес
 - photo_50: URL главной фотографии с размером 50x50px
 - photo_100: URL главной фотографии с размером 100х100px
 - photo_200: URL главной фотографии в максимальном размере
 */

struct Group: Decodable {
    let id: Int?
    let name: String?
    let screenName: String?
    let photo50: String?
    let photo100: String?
    let photo200: String?
}
