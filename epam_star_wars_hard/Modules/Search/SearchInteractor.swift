//
//  SearchInteractor.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 18.02.2020.
//  Copyright (c) 2020 Nickolay Truhin. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import Alamofire

final class SearchInteractor {
    
    fileprivate let _networkService = NetworkService()
    
}

// MARK: - Extensions -

extension SearchInteractor: SearchInteractorInterface {
    @discardableResult
    func searchCharacters(_ query: String, _ completion: @escaping PeopleResponseCompletionBlock) -> DataRequest {
        return _networkService.searchPeoples(query, completion)
    }
}