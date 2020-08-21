//
//  Networking.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 21.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import Foundation

protocol Networking {
    /**
     Метод для получения данных
     - parameter path: Путь до метода
     - parameter params: Параметры (словарь из строк)
     - parameter completion: Блок для получения данных или ошибки. Клоужер
     */
    func request(path: String, params: [String: String], completion: @escaping (Data?, Error?) -> Void)
}
