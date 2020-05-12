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
    var data: [ListDiffable]?
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
        
        presenter?.loadChannels()
        presenter?.loadEposides()
        presenter?.loadCategories()
        data = [eposidesSection, categoriesSection]
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
    }
    
    func setEposides(eposides: [Media]) {
        eposidesSection.items = eposides
    }
    
    func setCategories(categorieas: [Category]) {
        categoriesSection.items = categorieas
        
    }
    
}

extension HomeViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data ?? []
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        
        if object is SectionContainer<Category> {
            return CategoriesListSectionController()
        } else if object is SectionContainer<Media> {
            return NewEposidesSectionController()
        } else {
            return ListSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
