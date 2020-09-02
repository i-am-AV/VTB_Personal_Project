//
//  CoreDataStack.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 31.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "SN.Messenger")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
