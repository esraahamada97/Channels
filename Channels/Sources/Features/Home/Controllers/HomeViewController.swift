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
    var dataClass: DataClass = DataClass()
    var items: [ListDiffable] = []
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
       adapter.collectionView = collectionView
        
       adapter.dataSource = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         
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
        dataClass.channels = channels
    }
    
    func setEposides(eposides: [Media]) {
        dataClass.media = eposides
    }
    
    func setCategories(categorieas: [Category]) {
        dataClass.categories = categorieas
        
    }
    
}

extension HomeViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
       
        var items: [ListDiffable] = dataClass.categories ?? []
//        items += dataClass.channels ?? []
//        items += dataClass.media ?? []
        return items
//        let sectionType: SectionType = .categories
//        switch sectionType {
//        case .categories:
//            return self.cetegories
//        default:
//            return self.channels
//        }
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is Category {
            return CategoriesListSectionController()
        } else {
            return ListSectionController()
        }
//        if object is Category {
//       // switch object {
//            return CategoriesListSectionController()
////        case is Category:
////            return CategoriesListSectionController()
////        case is Media:
////            return NewEposidesSectionController()
////        default:
////            return ListSectionController()
////        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
