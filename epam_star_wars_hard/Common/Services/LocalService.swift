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
    func getRecents(container: NSPersistentContainer, completion: @escaping PeopleLocalResponseCompletionBlock) {
        container.loadPersistentStores(completionHandler: completion)
    }
}
