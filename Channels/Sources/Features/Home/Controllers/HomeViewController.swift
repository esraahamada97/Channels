//
//  HomeViewController.swift
//  Channels
//
//  Created user on 4/26/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var categoriesSection = SectionContainer<Category>(items: [])
    var eposidesSection = SectionContainer<Media>(items: [])
    var channelSection = SectionContainer<Channel>(items: [])
    var data: [ListDiffable] = []
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    // MARK: - Presenter
    private var presenter: HomePresenterProtocol?
    func setPresenter(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - Public Variables
    
    // MARK: - Private Variables
    
    // MARK: - Computed Variables
    
    // MARK: - IBOutlets
    
    // MARK: - Custom Setter
    
    // MARK: - View controller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadEposides()
        presenter?.loadChannels()
        presenter?.loadCategories()
        data = [eposidesSection, channelSection, categoriesSection]
        
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        adapter.performUpdates(animated: true, completion: nil)
    }
    
}

// MARK: - IBActions
extension HomeViewController {
    
}

// MARK: - Selectors
extension HomeViewController {
    
}

// MARK: - Private
extension HomeViewController {
    
}

// MARK: - Protocal
extension HomeViewController: HomeViewProtocol {
    func setChannels(channels: [Channel]) {
        channelSection.items = channels
        //        for item in channels {
        //            let channelSectin = SectionContainer<LatestMedia>(items: [])
        //            channelSectin.items = item.latestMedia ?? []
        //            data.append(channelSectin)
        //        }
        
    }
    
    func setEposides(eposides: [Media]) {
        eposidesSection.items = eposides
        //        data.append(eposidesSection)
    }
    
    func setCategories(categorieas: [Category]) {
        categoriesSection.items = categorieas
        //data.append(categoriesSection)
    }
    
}

extension HomeViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        
        if object is SectionContainer<Category> {
            return CategoriesListSectionController()
        } else if object is SectionContainer<Media> {
            return NewEposidesSectionController()
        } else if object is SectionContainer<Channel> {
            return ChannelsSectionCotroller()
        } else {
            return ListSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
