//
//  SeriesCollectionViewCell.swift
//  Channels
//
//  Created by user on 4/21/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class SeriesCollectionViewCell: UICollectionViewCell {
    static let seriesCellIdentifier: String = "SeriesCollectionViewCell"
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var imageContainerView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureSeriesCell() {
       imageContainerView.layer.cornerRadius = 10
        imageView.image = Asset.classicalMusic.image
    }

}
