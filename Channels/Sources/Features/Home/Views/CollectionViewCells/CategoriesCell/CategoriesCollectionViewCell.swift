//
//  CategoriesCollectionViewCell.swift
//  Channels
//
//  Created by user on 4/21/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import IGListKit
class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static let categoriesCellIdentifier: String = "CategoriesCollectionViewCell"

    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 20
    }
    
}

extension CategoriesCollectionViewCell: ListBindable {

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? Category else { return }
        categoryLabel.text = viewModel.name
        
    }

}
