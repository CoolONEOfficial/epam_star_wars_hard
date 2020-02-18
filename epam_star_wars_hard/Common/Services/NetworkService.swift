//
//  NetworkService.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 18.02.2020.
//  Copyright © 2020 Nickolay Truhin. All rights reserved.
//

import Foundation
import Alamofire

typealias PeopleResponseCompletionBlock = (DataResponse<PeopleResponse, AFError>) -> (Void)

class NetworkService {
    func searchPeoples(_ query: String, _ completion: @escaping PeopleResponseCompletionBlock) -> DataRequest {
        return AF.request("https://swapi.co/api/people/?search=\(query)").responseDecodable(of: PeopleResponse.self, completionHandler: completion)
    }
}
