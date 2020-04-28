//
//  CategoriesListSectionController.swift
//  Channels
//
//  Created by user on 4/28/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import IGListKit

class CategoriesListSectionController: ListSectionController, ListDisplayDelegate {
    var category: Category?
    
    override init() {
           super.init()
           displayDelegate = self
           inset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
       }

       override func numberOfItems() -> Int {
           return 4
       }

       override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext?.containerSize.width ?? CGFloat(), height: 55)
       }

       override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cellClass: AnyClass = CategoriesCollectionViewCell.self
        
        guard let cell = collectionContext?
            .dequeueReusableCell(of: cellClass,
                                 for: self,
                                 at: index)  else {
                                    return UICollectionViewCell() }
           
           if let cell = cell as? CategoriesCollectionViewCell {
            cell.configureCategoryCell(name: category?.name ?? "")
        }
           return cell
       }
    override func didUpdate(to object: Any) {
      category = object as? Category
    }

       // MARK: ListDisplayDelegate
       func listAdapter(_ listAdapter: ListAdapter, willDisplay sectionController: ListSectionController) {
           print("Will display section \(self.section)")
       }

       func listAdapter(_ listAdapter: ListAdapter,
                        willDisplay sectionController: ListSectionController,
                        cell: UICollectionViewCell,
                        at index: Int) {
                          print("Did will display cell \(index) in section \(self.section)")
       }

       func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying sectionController: ListSectionController) {
           print("Did end displaying section \(self.section)")
       }

       func listAdapter(_ listAdapter: ListAdapter,
                        didEndDisplaying sectionController: ListSectionController,
                        cell: UICollectionViewCell,
                        at index: Int) {
                          print("Did end displaying cell \(index) in section \(self.section)")
       }
    

}
