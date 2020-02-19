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
            try container.encode(name ?? "blank", forKey: .height)
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
        } catch {
            print ("error")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case height = "height"
    }
}

extension People: SearchViewItemInterface {
    var title: String? {
        return name
    }
}
