//
//  PeopleResponse.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 18.02.2020.
//  Copyright © 2020 Nickolay Truhin. All rights reserved.
//

import Foundation

struct PeopleResponse: Codable {
    var count: Int?
    var results: [People]?
}
