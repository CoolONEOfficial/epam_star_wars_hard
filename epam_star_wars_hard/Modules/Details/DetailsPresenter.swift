//
//  DetailsPresenter.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 20.02.2020.
//  Copyright (c) 2020 Nickolay Truhin. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class DetailsPresenter {

    // MARK: - Private properties -

    private unowned let view: DetailsViewInterface
    private let interactor: DetailsInteractorInterface
    private let wireframe: DetailsWireframeInterface

    private let _model: People
    lazy private var _modelDict: Dictionary? = {
        return try? _model.asDictionary()
    }()
    
    // MARK: - Lifecycle -

    init(view: DetailsViewInterface, interactor: DetailsInteractorInterface, wireframe: DetailsWireframeInterface, model: People) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self._model = model
    }
}

// MARK: - Extensions -

extension DetailsPresenter: DetailsPresenterInterface {
    func numberOfItems() -> Int {
        return _modelDict?.count ?? 0
    }
    
    func item(at indexPath: IndexPath) -> (key: String, value: String) {
        guard let dict = _modelDict else {
            return (key: "-", value: "-")
        }
        let item = Array(dict)[indexPath.row]
        return (key: item.key, value: item.value as? String ?? "-")
    }
    
}
