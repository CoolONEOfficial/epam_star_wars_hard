//
//  SearchViewController.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 18.02.2020.
//  Copyright (c) 2020 Nickolay Truhin. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class SearchViewController: UITableViewController {

    @IBOutlet var searchBar: UISearchBar!
    // MARK: - Public properties -

    var presenter: SearchPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        searchBar.delegate = self
    }
}

fileprivate var searchTask: DispatchWorkItem?

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTask?.cancel()
        
        searchTask = DispatchWorkItem { [weak self] in
            self?.didTextApplied(searchText)
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.75, execute: searchTask!)
    }
    
    func didTextApplied(_ text: String) {
        presenter.didSearchSubmitted(text)
    }
}

// MARK: - Extensions -

extension SearchViewController: SearchViewInterface {
}
