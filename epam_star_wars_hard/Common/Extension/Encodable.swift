//
//  Codable.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 20.02.2020.
//  Copyright © 2020 Nickolay Truhin. All rights reserved.
//

import Foundation

extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}
