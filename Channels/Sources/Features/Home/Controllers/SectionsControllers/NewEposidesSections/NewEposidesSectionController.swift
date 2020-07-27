//
//  NewEposidesSectionController.swift
//  Channels
//
//  Created by user on 5/12/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import IGListKit

class NewEposidesSectionController: ListSectionController {
    var mainEposides: MainEposides!

        lazy var adapter: ListAdapter = {
            let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                      viewController: self.viewController)
            adapter.dataSource = self
            return adapter
        }()
        
         override init() {
            super.init()
            inset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
            supplementaryViewSource = self // for header
            
        }
        
        override func sizeForItem(at index: Int) -> CGSize {
            return CGSize(width: collectionContext?.containerSize.width ?? 0, height: 520)
        }

       override func cellForItem(at index: Int) -> UICollectionViewCell {
        
                  guard let cell = collectionContext?.dequeueReusableCell(
                      withNibName: EmbeddedCollectionViewCell.embeddedCellIdentifier,
                      bundle: nil,
                      for: self,
                      at: index) as?  EmbeddedCollectionViewCell else {
                             return UICollectionViewCell()
                     }
                  //will put here the collection view
                  let embeddedCollectionView = cell.getCollectionView()
                  adapter.collectionView = embeddedCollectionView
                  return cell
              }
    
        override func didUpdate(to object: Any) {
            if let eposidesContainer = object as? SectionContainer<Media> {
                let container = MainEposides(mainEposides: eposidesContainer.items)
                mainEposides = container
            }
        }
}

extension NewEposidesSectionController: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [mainEposides]
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
            return EmbeddedSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

extension NewEposidesSectionController: ListSupplementaryViewSource {
    func supportedElementKinds() -> [String] {
        return [UICollectionView.elementKindSectionHeader, UICollectionView.elementKindSectionFooter]
    }

    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        switch elementKind {
        case UICollectionView.elementKindSectionHeader:
            return eposideHeaderView(atIndex: index)
        case UICollectionView.elementKindSectionFooter:
            return eposideFooterView(atIndex: index)
        default:
            fatalError("no supplementry view in new eposides")
        }
    }

    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
       
        switch elementKind {
        case UICollectionView.elementKindSectionHeader:
             return CGSize(width: collectionContext?.containerSize.width ?? 200, height: 80)
        case UICollectionView.elementKindSectionFooter:
            return CGSize(width: collectionContext?.containerSize.width ?? 200, height: 0.5)
        default:
            fatalError("no supplementry view in new eposides")
        }
    }

    // MARK: Private
    private func eposideHeaderView(atIndex index: Int) -> UICollectionReusableView {
        guard let view = collectionContext?.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            for: self,
            nibName: TitleHeaderCollectionReusableView.titleHeaderIdentifier,
            bundle: nil,
            at: index) as? TitleHeaderCollectionReusableView else {
                fatalError("no header in eposides")
        }
        view.configureHeader(title: "New Eposides")
        return view
    }

    private func eposideFooterView(atIndex index: Int) -> UICollectionReusableView {
        guard let view = collectionContext?.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            for: self,
            nibName: FooterCollectionReusableView.footerIdentifier,
            bundle: nil,
            at: index) as? FooterCollectionReusableView else {
                fatalError("no footer in eposides")
        }
        return view
    }
}
