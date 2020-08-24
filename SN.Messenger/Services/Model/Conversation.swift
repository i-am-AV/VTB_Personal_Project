//
//  Conversation.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import Foundation

/**
 Объект описывает беседу с пользователем, сообществом или групповой чат
 - peer: Информация о собеседнике
 - lastMessageId: Идентификатор последнего сообщения
 - inRead: Идентификатор последнего прочтенного входящего сообщения
 - outRead: Идентификатор последнего прочтенного исходящего сообщения
 */

struct Conversation: Decodable  {
    let peer: Peer?
    let lastMessageId: Int?
//    let inRead: Int?
//    let outRead: Int?
    let chatSettings: ChatSettings?
}

/**
Информация о собеседнике
- id: Идентификатор назначения
- type: Тип. Возможные значения: user, chat, group, email
- localId: локальный идентификатор назначения. Для чатов — id - 2000000000, для сообществ — -id, для e-mail — -(id+2000000000)
*/

struct Peer: Decodable {
    let id: Int?
    let type: String?
    let localId: Int?
}

struct ChatSettings: Decodable {
    let title: String?
    let photo50: String?
    let photo100: String?
    let photo200: String?
}
