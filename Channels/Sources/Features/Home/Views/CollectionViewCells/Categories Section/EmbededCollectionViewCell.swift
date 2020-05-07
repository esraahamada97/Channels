//
//  EmbededCollectionViewCell.swift
//  Channels
//
//  Created by user on 5/7/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class EmbededCollectionViewCell: UICollectionViewCell {
    
 static let embeddedCategoriesCellIdentifier: String = "EmbededCollectionViewCell"
    
    @IBOutlet weak var embededCategoriosCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        embededCategoriosCollectionView.backgroundColor = .red
    }

}
