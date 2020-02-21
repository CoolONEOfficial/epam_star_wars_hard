//
//  CollectionViewCell.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 19.02.2020.
//  Copyright © 2020 Nickolay Truhin. All rights reserved.
//

import UIKit

struct PeopleCellData {
    var model: SearchViewItemInterface
    var didDeleteClick: () -> Void
    var deletable: Bool
}

class PeopleCell: UICollectionViewCell {
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var horizontalStack: UIStackView!
    @IBOutlet var deleteButton: UIButton!
    
    public var indexPath: IndexPath!
    public var data: PeopleCellData? {
        didSet {
            textLabel.text = data?.model.title
            deleteButton.isHidden = !(data?.deletable ?? false)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        deleteButton.tintColor = .lightGray
    }
    
    public func configure(with data: PeopleCellData) {
        self.data = data
    }
    
    @IBAction func didDeleteClick(_ sender: Any) {
        data?.didDeleteClick()
    }
}
