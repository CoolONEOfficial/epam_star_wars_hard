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

    // MARK: - Lifecycle -

    init(view: SearchViewInterface, interactor: SearchInteractorInterface, wireframe: SearchWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension SearchPresenter: SearchPresenterInterface {
    func didSearchSubmitted(_ query: String) {
        interactor.searchCharacters(query) { (response) in
            debugPrint("resp: \(response)")
        }
    }
}
