//
//  LastMessage.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import Foundation

/**
 Объект, описывающий последнее сообщение в беседе
 - id: Идентификатор сообщения
 - date: Время отправки в Unixtime
 - peerId: Идентификатор назначения
 - fromId: Идентификатор отправителя
 - text: Текст сообщения
 - randomId: Идентификатор, используемый при отправке сообщения. Возвращается только для исходящих сообщений
 */

struct LastMessage: Decodable  {
    let id: Int
    let date: Int
    let peerId: Int
    let fromId: Int
    let text: String
    let randomId: Int?
}
