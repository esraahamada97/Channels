//
//  ChannelCollectionViewCell.swift
//  Channels
//
//  Created by user on 4/21/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import IGListKit

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
    
}

extension ChannelCollectionViewCell: ListBindable {

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? Media else { return }
        configureNewEposidesCell(eposide: viewModel)
        
    }
    
    func configureNewEposidesCell(eposide: Media) {
        guard let imageUrl = URL(string: eposide.coverAsset.url) else { return }
        if let data = NSData(contentsOf: imageUrl) {
            imageView.image = UIImage(data: data as Data)
            }
        titleLabel.text = eposide.title
        subTitleLabel.text = eposide.channel.title
    
    }

}
