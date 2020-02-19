//
//  Constants.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 19.02.2020.
//  Copyright © 2020 Nickolay Truhin. All rights reserved.
//

import Foundation

struct Constants {
    struct API {
        static let baseUrl = "https://swapi.co/api"
        
        enum Endpoint {
            case search
            
            var endpoint: String {
                switch self {
                case .search:
                    return "/people/?search="
                }
            }
        }
        
        static func createUrl(endpoint: Endpoint) -> String {
            return "\(API.baseUrl)\(endpoint.endpoint)"
        }
    }
}
