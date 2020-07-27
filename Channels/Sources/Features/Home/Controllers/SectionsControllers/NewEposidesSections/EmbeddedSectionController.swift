//
//  EmbeddedSectionController.swift
//  Channels
//
//  Created by user on 5/12/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import IGListKit

class EmbeddedSectionController: ListSectionController {
    var eposides: [Media] = []
    
     override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        minimumInteritemSpacing = 10
    }
    
    override func didUpdate(to object: Any) {
        if let eposides = object as? MainEposides {
            self.eposides = eposides.mainEposides 
        }
    }
    
    override func numberOfItems() -> Int {
        return eposides.count
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let height = collectionContext?.containerSize.height ?? 0
        let width = (collectionContext?.containerSize.width ?? 0)
        return CGSize(width: width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(
            withNibName: ChannelCollectionViewCell.channelCellIdentifier,
            bundle: nil,
            for: self,
            at: index) as?  ChannelCollectionViewCell else {
                return UICollectionViewCell()
        }
        cell.bindViewModel(eposides[index])
        return cell
    }
    
}
