//
//  EmbeddedCollectionViewCell.swift
//  Channels
//
//  Created by user on 5/12/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class EmbeddedCollectionViewCell: UICollectionViewCell {
 static let embeddedCellIdentifier: String = "EmbeddedCollectionViewCell"
    
    @IBOutlet private weak var embededCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func getCollectionView() -> UICollectionView {
        return embededCollectionView
    }
}
