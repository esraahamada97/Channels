//
//  TitleHeaderCollectionReusableView.swift
//  Channels
//
//  Created by user on 4/21/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class TitleHeaderCollectionReusableView: UICollectionReusableView {
  static let titleHeaderIdentifier: String = "TitleHeaderCollectionReusableView"
     
    @IBOutlet private weak var titleLabe: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureHeader(title: String) {
        titleLabe.text = title
    }
}
