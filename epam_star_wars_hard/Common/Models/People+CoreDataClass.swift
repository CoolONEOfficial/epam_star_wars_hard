//
//  People+CoreDataClass.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 18.02.2020.
//  Copyright © 2020 Nickolay Truhin. All rights reserved.
//
//

import Foundation
import CoreData

@objc(People)
public class People: NSManagedObject, Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(name ?? "blank", forKey: .name)
            try container.encode(height ?? "blank", forKey: .height)
            try container.encode(mass ?? "blank", forKey: .mass)
            try container.encode(hairColor ?? "blank", forKey: .hairColor)
            try container.encode(skinColor ?? "blank", forKey: .skinColor)
            try container.encode(eyeColor ?? "blank", forKey: .eyeColor)
            try container.encode(birthYear ?? "blank", forKey: .birthYear)
            try container.encode(gender ?? "blank", forKey: .gender)
        } catch {
            print("error")
        }
    }
    
    required convenience public init(from decoder: Decoder) throws {
        
        guard let contextUserInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "People", in: managedObjectContext)
            else {
                fatalError("decode failure")
        }
        // Super init of the NSManagedObject
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            name = try values.decode(String.self, forKey: .name)
            height = try values.decode(String.self, forKey: .height)
            mass = try values.decode(String.self, forKey: .mass)
            hairColor = try values.decode(String.self, forKey: .hairColor)
            skinColor = try values.decode(String.self, forKey: .skinColor)
            eyeColor = try values.decode(String.self, forKey: .eyeColor)
            birthYear = try values.decode(String.self, forKey: .birthYear)
            gender = try values.decode(String.self, forKey: .gender)
        } catch {
            print ("error")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
    }
}

extension People: SearchViewItemInterface {
    var title: String? {
        return name
    }
}
