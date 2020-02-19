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
        
        searchBar.delegate = self
        presenter.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter.item(at: indexPath)
        let cell = UITableViewCell()
        
        cell.textLabel?.text = item.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems()
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
        presenter.searchDidSubmitted(text)
    }
}

// MARK: - Extensions -

extension SearchViewController: SearchViewInterface {
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func setEmptyPlaceholderHidden(_ hidden: Bool) {
        // TODO: empty placeholder
    }
    
    func setLoadingVisible(_ visible: Bool) {
        searchBar.isLoading = visible
    }
    
}
