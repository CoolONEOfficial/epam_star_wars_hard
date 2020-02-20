//
//  String.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 20.02.2020.
//  Copyright © 2020 Nickolay Truhin. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
