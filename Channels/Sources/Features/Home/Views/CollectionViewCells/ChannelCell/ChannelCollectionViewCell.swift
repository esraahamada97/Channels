//
//  ChannelCollectionViewCell.swift
//  Channels
//
//  Created by user on 4/21/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ChannelCollectionViewCell: UICollectionViewCell {
    static let channelCellIdentifier: String = "ChannelCollectionViewCell"
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var imageContainerView: UIView!
    
    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var subTitleLabel: UILabel!
    
    override func
        awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.image = Asset.violinImage.image
        imageContainerView.layer.cornerRadius = 10
    }
    
    func configureCahnnelCell() {
        
    }
    
}
