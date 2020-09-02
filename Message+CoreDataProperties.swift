//
//  Message+CoreDataProperties.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 31.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message")
    }

    @NSManaged public var date: String?
    @NSManaged public var name: String?
    @NSManaged public var photo: String?
    @NSManaged public var text: String?

}
