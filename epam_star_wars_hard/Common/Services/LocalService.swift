//
//  LocalService.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 19.02.2020.
//  Copyright © 2020 Nickolay Truhin. All rights reserved.
//

import Foundation
import CoreData

typealias PeopleLocalResponseCompletionBlock = (NSPersistentStoreDescription, Error?) -> Void

class LocalService {
    func getRecents(viewContext: NSManagedObjectContext) -> [People]? {
        do {
            return try viewContext.fetch(People.fetchRequest())
        } catch {
            print("Fetch failed")
            return nil
        }
    }
    
    func addRecent(_ people: People, viewContext: NSManagedObjectContext) {
        viewContext.insert(people)
        
        do {
          try viewContext.save()
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
