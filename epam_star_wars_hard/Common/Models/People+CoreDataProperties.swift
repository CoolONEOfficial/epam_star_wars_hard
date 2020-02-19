//
//  People+CoreDataProperties.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 18.02.2020.
//  Copyright © 2020 Nickolay Truhin. All rights reserved.
//
//

import Foundation
import CoreData


extension People {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<People> {
        return NSFetchRequest<People>(entityName: "People")
    }

    @NSManaged public var name: String?
    @NSManaged public var height: String?
    @NSManaged public var mass: String?
    @NSManaged public var hairColor: String?
    @NSManaged public var skinColor: String?
    @NSManaged public var eyeColor: String?
    @NSManaged public var birthYear: String?
    @NSManaged public var gender: String?
    
}
