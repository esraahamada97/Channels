////
////  NewEposidesSectionController.swift
////  Channels
////
////  Created by user on 4/28/20.
////  Copyright © 2020 user. All rights reserved.
////
//
import UIKit
import IGListKit
//
class NewEposidesSectionController: ListSectionController {
//
//    override init() {
//      super.init()
//      inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
//    }
//    
//}
//
// MARK: - Data Provider
//extension NewEposidesSectionController {
//  override func numberOfItems() -> Int {
//    return 2
//  }
//  
//  override func sizeForItem(at index: Int) -> CGSize {
//    guard
//      let context = collectionContext,
//      let entry = entry
//      else {
//        return .zero
//    }
//    let width = context.containerSize.width
//    
//    if index == 0 {
//      return CGSize(width: width, height: 30)
//    } else {
//      return JournalEntryCell.cellSize(width: width, text: entry.text)
//    }
//
//  }
//  
//  override func cellForItem(at index: Int) -> UICollectionViewCell {
//    let cellClass: AnyClass = index == 0 ? JournalEntryDateCell.self : JournalEntryCell.self
//    let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
//    
//    if let cell = cell as? JournalEntryDateCell {
//      cell.label.text = "SOL \(solFormatter.sols(fromDate: entry.date))"
//    } else if let cell = cell as? JournalEntryCell {
//      cell.label.text = entry.text
//    }
//    return cell
//
//  }
//  
//  override func didUpdate(to object: Any) {
//    entry = object as? JournalEntry
//  }
}
