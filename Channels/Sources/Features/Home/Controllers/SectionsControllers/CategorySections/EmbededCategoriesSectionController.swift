//
//  EmbededCategoriesSectionController.swift
//  Channels
//
//  Created by user on 5/7/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import IGListKit

class EmbededCategoriesSectionController: ListSectionController {
    private var category: Category?

       override init() {
           super.init()
           //self.inset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
         self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
       }

       override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        let itemSize = ((width - 50) / 2) - 8
           return CGSize(width: itemSize, height: itemSize / 2)
       
       }

       override func cellForItem(at index: Int) -> UICollectionViewCell {
           guard let cell = collectionContext?.dequeueReusableCell(
            withNibName: CategoriesCollectionViewCell.categoriesCellIdentifier,
            bundle: nil,
            for: self,
            at: index) as? CategoriesCollectionViewCell else {
                   return UICollectionViewCell()
           }
        cell.bindViewModel(category)
           return cell
       }

       override func didUpdate(to object: Any) {
           category = object as? Category
       }
}
