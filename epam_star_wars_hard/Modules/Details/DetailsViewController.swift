//
//  DetailsViewController.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 20.02.2020.
//  Copyright (c) 2020 Nickolay Truhin. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class DetailsViewController: UITableViewController {

    // MARK: - Public properties -

    var presenter: DetailsPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter.item(at: indexPath)
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        
        cell.textLabel?.text = item.key
            .replacingOccurrences(of: "_", with: " ")
            .capitalizingFirstLetter()
        cell.detailTextLabel?.text = item.value
        
        return cell
    }
}

// MARK: - Extensions -

extension DetailsViewController: DetailsViewInterface {
}
