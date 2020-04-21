//
//  HomeViewController.swift
//  Channels
//
//  Created by user on 3/24/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    static let sectionHeaderElementKind = "section-header-element-kind"

    enum Section: String, CaseIterable {
      case channel
//      case series
//      case categories
        var cellIdentifier: String {
            switch self {
            case .channel:
                return "ChannelCollectionViewCell"
//            case .series:
//                return "SeriesCollectionViewCell"
//            case .categories:
//                return "CategoriesCollectionViewCell"
            }
        }
    }
    var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>! = nil
   
    @IBOutlet weak var channelCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        navigationController?.navigationItem.title = "Channel"
        configureCollectionView()
        configureDataSource()
         channelCollectionView.dataSource = dataSource
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeViewController: UICollectionViewDelegate {
    
  func configureCollectionView() {
    let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
    view.addSubview(collectionView)
    collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    collectionView.backgroundColor = .systemBackground
    collectionView.delegate = self
   collectionView.register(
     ChannelCollectionViewCell.self,
     forCellWithReuseIdentifier: ChannelCollectionViewCell.channelCellIdentifier)
    collectionView.register(
        SeriesCollectionViewCell.self,
        forCellWithReuseIdentifier: SeriesCollectionViewCell.seriesCellIdentifier)
    collectionView.register(
        CategoriesCollectionViewCell.self,
        forCellWithReuseIdentifier: CategoriesCollectionViewCell.categoriesCellIdentifier)

    collectionView.register(
      TitleHeaderCollectionReusableView.self,
      forSupplementaryViewOfKind: HomeViewController.sectionHeaderElementKind,
      withReuseIdentifier: TitleHeaderCollectionReusableView.TitleHeaderIdentifier)

    collectionView.register(
    CompositeHeaderCollectionReusableView.self,
    forSupplementaryViewOfKind: HomeViewController.sectionHeaderElementKind,
    withReuseIdentifier: CompositeHeaderCollectionReusableView.CompositeHeaderIdentifier)
    channelCollectionView = collectionView
  }

  func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource
      <Section, AnyHashable>(collectionView: channelCollectionView) {
(collectionView: UICollectionView, indexPath: IndexPath, item: AnyHashable) -> UICollectionViewCell? in

        let sectionType = Section.allCases[indexPath.section]
        switch sectionType {
        case .channel:
          guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ChannelCollectionViewCell.channelCellIdentifier,
            for: indexPath) as? ChannelCollectionViewCell else { fatalError("Could not create new cell") }
          cell.configureCahnnelCell()
          return cell

//        case .series:
//          guard let cell = collectionView.dequeueReusableCell(
//            withReuseIdentifier: sectionType.cellIdentifier,
//            for: indexPath) as? SeriesCollectionViewCell else { fatalError("Could not create new cell") }
//          cell.configureSeriesCell()
//          return cell
//
//        case .categories:
//          guard let cell = collectionView.dequeueReusableCell(
//            withReuseIdentifier: sectionType.cellIdentifier,
//            for: indexPath) as? CategoriesCollectionViewCell else { fatalError("Could not create new cell") }
//          cell.configureCategoryCell()
//          return cell

        }
    }
    
    dataSource.supplementaryViewProvider = { (
      collectionView: UICollectionView,
      kind: String,
      indexPath: IndexPath) -> UICollectionReusableView? in

      guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
        ofKind: kind,
        withReuseIdentifier: TitleHeaderCollectionReusableView.TitleHeaderIdentifier,
        for: indexPath) as? TitleHeaderCollectionReusableView else { fatalError("Cannot create header view") }
      return supplementaryView
    }

    let snapshot = snapshotForCurrentState()
    dataSource.apply(snapshot, animatingDifferences: false)
  }

  func generateLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
      layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
      let isWideView = layoutEnvironment.container.effectiveContentSize.width < 500

      let sectionLayoutKind = Section.allCases[sectionIndex]
      switch (sectionLayoutKind) {
      case .channel: return self.generateChannelLayout(isWide: isWideView)
//      case .series: return self.generateSeriesLayout()
//      case .categories: return self.generateCategoriesLayout(isWide: isWideView)
      }
    }
    return layout
  }

  func generateChannelLayout(isWide: Bool) -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                          heightDimension: .fractionalWidth(0.5))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    // Show one item plus peek on narrow screens, two items plus peek on wider screens
    let groupFractionalWidth = isWide ? 0.475 : 0.95
    let groupFractionalHeight: Float = isWide ? 1/3 : 2/3
    let groupSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(CGFloat(groupFractionalWidth)),
      heightDimension: .fractionalWidth(CGFloat(groupFractionalHeight)))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
    group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

    let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                            heightDimension: .estimated(44))
    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
      layoutSize: headerSize,
      elementKind: HomeViewController.sectionHeaderElementKind, alignment: .top)

    let section = NSCollectionLayoutSection(group: group)
    section.boundarySupplementaryItems = [sectionHeader]
    section.orthogonalScrollingBehavior = .groupPaging

    return section
  }

  func generateSeriesLayout() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .fractionalWidth(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let groupSize = NSCollectionLayoutSize(
      widthDimension: .absolute(140),
      heightDimension: .absolute(186))
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
    group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

    let headerSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .estimated(44))
    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
      layoutSize: headerSize,
      elementKind: HomeViewController.sectionHeaderElementKind,
      alignment: .top)

    let section = NSCollectionLayoutSection(group: group)
    section.boundarySupplementaryItems = [sectionHeader]
    section.orthogonalScrollingBehavior = .groupPaging

    return section
  }

  func generateCategoriesLayout(isWide: Bool) -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

    let groupHeight = NSCollectionLayoutDimension.fractionalWidth(isWide ? 0.25 : 0.5)
    let groupSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: groupHeight)
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: isWide ? 4 : 2)

    let headerSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .estimated(44))
    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
      layoutSize: headerSize,
      elementKind: HomeViewController.sectionHeaderElementKind,
      alignment: .top)

    let section = NSCollectionLayoutSection(group: group)
    section.boundarySupplementaryItems = [sectionHeader]

    return section
  }

  func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, AnyHashable> {
    
    var channelsArray = [Channel]()
    for i in 0..<5 {
        channelsArray.append(Channel(
            title: "The Cure For Loneliness",
            subTitle: "The Cure For Loneliness",
            imageUrl: ""))
    }

    var snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
    snapshot.appendSections([Section.channel])
    snapshot.appendItems(channelsArray)

//    snapshot.appendSections([Section.series])
//    snapshot.appendItems(channelsArray)
//
//    snapshot.appendSections([Section.categories])
//    snapshot.appendItems(channelsArray)
    return snapshot
  }

}
