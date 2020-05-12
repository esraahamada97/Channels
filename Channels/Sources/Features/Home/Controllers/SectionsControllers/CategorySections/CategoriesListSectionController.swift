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
    var categories: [Category] = []
    
    private var dataClass: DataClass?
  
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: viewController)
    }()
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        minimumInteritemSpacing = 20
        minimumLineSpacing = 20
        //supplementaryViewSource = self
        //displayDelegate = self
    }
    
    override func numberOfItems() -> Int {
        return categories.count
    }

    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        let width = context.containerSize(for: self).width
        let widthItem = ((width + 20) / 2)
        return CGSize(width: (widthItem - ( minimumInteritemSpacing )), height: 95)
    }
    
   override func cellForItem(at index: Int) -> UICollectionViewCell {
    
    guard let cell = collectionContext?.dequeueReusableCell(
        withNibName: CategoriesCollectionViewCell.categoriesCellIdentifier,
        bundle: nil,
        for: self,
        at: index) as?  CategoriesCollectionViewCell else {
            return UICollectionViewCell()
    }
    cell.bindViewModel(categories[index])
       return cell
   }

   override func didUpdate(to object: Any) {
       if let container = (object as? SectionContainer<Category>) {
           self.categories = container.items
       } else {
           self.categories = []
       }
    
   }
    
}
