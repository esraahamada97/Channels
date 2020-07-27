//
//  ChannelsSectionCotroller.swift
//  Channels
//
//  Created by user on 5/18/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import IGListKit

class ChannelsSectionCotroller: ListSectionController {
    
    var mainChannels: MainChannels!

           lazy var adapter: ListAdapter = {
               let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                         viewController: self.viewController)
               adapter.dataSource = self
               return adapter
           }()
           
            override init() {
               super.init()
               inset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
               //supplementaryViewSource = self // for header
               
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
            embeddedCollectionView.backgroundColor = .red
                     return cell
                 }
       
           override func didUpdate(to object: Any) {
               if let channelContainer = object as? SectionContainer<Channel> {
                   let container = MainChannels(mainChannels: channelContainer.items)
                   mainChannels = container
               }
           }

}

extension ChannelsSectionCotroller: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [mainChannels, mainChannels, mainChannels]
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
            return ListSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
