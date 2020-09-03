//
//  CoreDataProtocol.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 03.09.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import Foundation

protocol CoreDataProtocol: class {
    func saveMessages(viewModel: MessageViewModel)
    func loadViewModel()
}
