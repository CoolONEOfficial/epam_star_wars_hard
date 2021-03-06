//
//  SearchPresenter.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 18.02.2020.
//  Copyright (c) 2020 Nickolay Truhin. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class SearchPresenter {

    // MARK: - Private properties -

    private unowned let view: SearchViewInterface
    private let interactor: SearchInteractorInterface
    private let wireframe: SearchWireframeInterface

    private var _items: [People] = []
    
    // MARK: - Lifecycle -

    init(view: SearchViewInterface, interactor: SearchInteractorInterface, wireframe: SearchWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension SearchPresenter: SearchPresenterInterface {
    func numberOfItems() -> Int {
        return _items.count
    }

    func item(at indexPath: IndexPath) -> SearchViewItemInterface {
        return _items[indexPath.row]
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        interactor.addRecent(_items[indexPath.row])
        
        wireframe.navigate(to: .details(_items[indexPath.row]))
    }
    
    func didDeleteItem(at indexPath: IndexPath) {
        interactor.removeRecent(_items[indexPath.row])
        _items.remove(at: indexPath.row)
    }
    
    func searchDidSubmitted(_ query: String) {
        if query.isEmpty {
            _showRecents()
        } else {
            view.setLoadingVisible(true)
            interactor.searchCharacters(query: query)
            { (response) in
                switch response.result {
                case .success(let response):
                    self._handlePeoplesSearchResult(response)
                case .failure(let error):
                    guard !error.isExplicitlyCancelledError else {
                        return
                    }
                    self.wireframe.navigate(to: .error(error))
                }
                self.view.setLoadingVisible(false)
            }
        }
    }
    
    func viewDidLoad() {
        _showRecents()
    }
    
    // MARK: Utility
    
    private func _handlePeoplesSearchResult(_ result: PeopleResponse) {
        
        if let peoples = result.results {
            _items = peoples
            view.reloadData()
        } else {
            debugPrint("Result peoples is not found!")
        }
    }
    
    private func _showRecents() {
        _items = interactor.loadRecents() ?? []
        view.reloadData()
    }
}
