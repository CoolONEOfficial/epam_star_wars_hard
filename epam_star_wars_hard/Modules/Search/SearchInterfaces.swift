//
//  SearchInterfaces.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 18.02.2020.
//  Copyright (c) 2020 Nickolay Truhin. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import Alamofire

enum SearchNavigationOption {
    case details
}

protocol SearchWireframeInterface: WireframeInterface {
}

protocol SearchViewInterface: ViewInterface {
    func reloadData()
    func setEmptyPlaceholderHidden(_ hidden: Bool)
    func setLoadingVisible(_ visible: Bool)
}

protocol SearchPresenterInterface: PresenterInterface {
    func searchDidSubmitted(_ query: String)
 
    func numberOfItems() -> Int
    func item(at indexPath: IndexPath) -> SearchViewItemInterface
    func didSelectItem(at indexPath: IndexPath)
}

protocol SearchInteractorInterface: InteractorInterface {
    @discardableResult
    func searchCharacters(query: String, completion: @escaping PeopleNetworkResponseCompletionBlock) -> DataRequest
}

protocol SearchViewItemInterface {
    var title: String? { get }
}
