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
    var cetegories: [Category] = []
    var channels: [Channel] = []
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
        self.channels = channels
    }
    
    func setEposides(eposides: [Media]) {
        
    }
    
    func setCategories(categorieas: [Category]) {
        self.cetegories = categorieas
        
    }
    
}

extension HomeViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        presenter?.loadCategories()
        return self.cetegories
//        let sectionType: SectionType = .categories
//        switch sectionType {
//        case .categories:
//            return self.cetegories
//        default:
//            return self.channels
//        }
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let sectionCont = CategoriesListSectionController.init(categories: self.cetegories)
        if object is Category {
          return sectionCont
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
