//
//  CategoriesListSectionController.swift
//  Channels
//
//  Created by user on 4/28/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import IGListKit

class CategoriesListSectionController: ListSectionController, ListAdapterDataSource {
    
   private var categoryObject: Category?
   
   var categories: [Category]?
    
    override init() {
        super.init()
        self.minimumInteritemSpacing = 0
    }
    lazy var adapter: ListAdapter = {
           let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                     viewController: self.viewController)
           adapter.dataSource = self
           return adapter
       }()
    
  override func sizeForItem(at index: Int) -> CGSize {
    return CGSize(width: collectionContext?.containerSize.width ?? CGFloat(), height: 100)
     }
    
   override func cellForItem(at index: Int) -> UICollectionViewCell {
    
    guard let cell = collectionContext?.dequeueReusableCell(
        withNibName: EmbededCollectionViewCell.embeddedCategoriesCellIdentifier,
        bundle: nil,
        for: self,
        at: index) as? EmbededCollectionViewCell else {
            return UICollectionViewCell()
    }
    adapter.collectionView = cell.embededCategoriosCollectionView
    
       return cell
   }

   override func didUpdate(to object: Any) {
       self.categoryObject = object as? Category
    
   }
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let cat = categoryObject else {return []}
        return [cat]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return EmbededCategoriesSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
