//
//  CategoriesListSectionController.swift
//  Channels
//
//  Created by user on 4/28/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import IGListKit

class CategoriesListSectionController: ListSectionController {
   private var categoryObject: Category?
    
    var categorieas: [Category]?
    init(categories: [Category]) {
        self.categorieas = categories
    }
    
    override func numberOfItems() -> Int {
        
        return 1
        
    }
  override func sizeForItem(at index: Int) -> CGSize {
    guard let contextOfCollection = collectionContext,
      let entry = categoryObject
      else {
        return .zero
    }

    let objectWidth = (contextOfCollection.containerSize.width - 16 - 16)/2 // dividing by 2 because
                                                                            // you want 2 columns
    return CGSize(width: objectWidth, height:objectWidth)
  }

   override func cellForItem(at index: Int) -> UICollectionViewCell {
    
    guard let cell = collectionContext?.dequeueReusableCell(
        withNibName: CategoriesCollectionViewCell.categoriesCellIdentifier,
        bundle: nil,
        for: self,
        at: index) as? CategoriesCollectionViewCell else {
            return UICollectionViewCell()
    }
        
    cell.bindViewModel(categoryObject)

       return cell
   }

   override func didUpdate(to object: Any) {
       self.categoryObject = object as? Category
   }
}
