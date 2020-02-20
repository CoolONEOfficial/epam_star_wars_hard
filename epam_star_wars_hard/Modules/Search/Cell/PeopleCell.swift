//
//  CollectionViewCell.swift
//  epam_star_wars_hard
//
//  Created by Nickolay Truhin on 19.02.2020.
//  Copyright © 2020 Nickolay Truhin. All rights reserved.
//

import UIKit

class PeopleCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    
    public var indexPath: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
    }
    
    public func configure(with model: SearchViewItemInterface) {
        textLabel.text = model.title
    }
}
