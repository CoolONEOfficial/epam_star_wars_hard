//
//  NetworkService.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 18.02.2020.
//  Copyright © 2020 Nickolay Truhin. All rights reserved.
//

import Foundation
import Alamofire
import CoreData

typealias PeopleNetworkResponseCompletionBlock = (DataResponse<PeopleResponse, AFError>) -> (Void)

class NetworkService {
    func searchPeoples(
        query: String,
        viewContext: NSManagedObjectContext,
        completion: @escaping PeopleNetworkResponseCompletionBlock
    ) -> DataRequest {
        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.context!] = viewContext
        
        return AF.request("\(Constants.API.createUrl(endpoint: .search))\(query)")
            .responseDecodable(of: PeopleResponse.self, decoder: decoder, completionHandler: completion)
    }
}
