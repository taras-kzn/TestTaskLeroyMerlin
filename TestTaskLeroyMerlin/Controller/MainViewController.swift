//
//  MainViewController.swift
//  TestTaskLeroyMerlin
//
//  Created by admin on 16.04.2021.
//

import Foundation
import UIKit
import SwiftUI

final class MainViewController: UIViewController {
//MARK: - property
    private var collectionView: UICollectionView!
    private var dataSorce: UICollectionViewDiffableDataSource<SectionModel, ItemModel>?
    private let sectionModel = sections
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        createDataSource()
        reloadDate()
    }
//MARK: - Private Function
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: creatComposittionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight ]
        collectionView.backgroundColor = .white
        collectionView.register(UINib(nibName: "SearchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: SearchCollectionViewCell.reuseID)
        collectionView.register(UINib(nibName: "BestPriceViewCell", bundle: nil), forCellWithReuseIdentifier: BestPriceViewCell.reuseID)
        collectionView.register(UINib(nibName: "CatalogViewCell", bundle: nil), forCellWithReuseIdentifier: CatalogViewCell.reuseID)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.reuseID)
        navigationController?.isNavigationBarHidden = true
        view.addSubview(collectionView)
    }

//MARK: - Setup Layout
    func creatComposittionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, ayoutEnvironment) -> NSCollectionLayoutSection? in
            let section = self.sectionModel[sectionIndex]
            switch section.type {
            case "Поиск":
                return self.createSearchLayout()
            case "Каталог":
                return self.createLayoutCatalog()
            case "Просмотренные":
                return self.createLayoutLookOver()
            case "лучшая цена":
                return self.createLayoutBestPrice()
            default:
                return self.createLayoutCatalog()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 11
        layout.configuration = config
        return layout
    }
    
    private func createSearchLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize =  NSCollectionLayoutSize(widthDimension:  .fractionalWidth(1), heightDimension: .absolute(275))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets =  NSDirectionalEdgeInsets(top: -80, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private func createLayoutCatalog() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let groupSize =  NSCollectionLayoutSize(widthDimension:  .fractionalWidth(0.40), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets =  NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 0)
        return section
    }
    
    private func createLayoutBestPrice() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let groupSize =  NSCollectionLayoutSize(widthDimension:  .fractionalWidth(0.4), heightDimension: .absolute(225))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets =  NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 10)
        let header = creatSectionHeader()
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    private func createLayoutLookOver() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let groupSize =  NSCollectionLayoutSize(widthDimension:  .fractionalWidth(0.4), heightDimension: .absolute(225))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets =  NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 10)
        let header = creatSectionHeader()
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    private func creatSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let laoutSectionSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: laoutSectionSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 3, bottom: 0, trailing: 0)
        return sectionHeader
    }
    
//MARK: - manadger data and snapshot
    private func createCell(collectionView: UICollectionView, indexPath: IndexPath, item: ItemModel ) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestPriceViewCell.reuseID, for: indexPath) as? BestPriceViewCell else { return UICollectionViewCell() }
        cell.configure(section: item)
        return cell
    }
    
    private func createDataSource() {
        dataSorce = UICollectionViewDiffableDataSource<SectionModel, ItemModel>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            switch self.sectionModel[indexPath.section].type {
            case "Поиск":
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseID, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
                return cell
            case "Просмотренные":
                let cell = self.createCell(collectionView: collectionView, indexPath: indexPath, item: item)
                return cell
            case "Каталог":
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogViewCell.reuseID, for: indexPath) as? CatalogViewCell else { return UICollectionViewCell() }
                cell.configure(item: item)
                return cell
            case "лучшая цена":
                let cell = self.createCell(collectionView: collectionView, indexPath: indexPath, item: item)
                return cell
            default:
                let cell = UICollectionViewCell()
                return cell
            }
        })
        
        dataSorce?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.reuseID, for: indexPath) as? SectionHeaderView else { return nil }
            guard let firstTitle = self?.dataSorce?.itemIdentifier(for: indexPath) else {return nil}
            guard let section = self?.dataSorce?.snapshot().sectionIdentifier(containingItem: firstTitle) else { return nil }
            if section.title.isEmpty { return nil }
            sectionHeader.title.text = section.title
            return sectionHeader
        }
    
    }
    
    private func reloadDate() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionModel,ItemModel>()
        
        snapshot.appendSections(sectionModel)
        
        for section in sectionModel {
            snapshot.appendItems(section.items,toSection: section)
        }
        dataSorce?.apply(snapshot)
    }
}
// MARK: - SwiftUI
struct MainProvider: PreviewProvider {
    
    static var previews: some View {
        ContaiterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContaiterView: UIViewControllerRepresentable {
        let tabBar = MainTabBarTableViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainProvider.ContaiterView>) -> some MainTabBarTableViewController {
            return tabBar
        }
        func updateUIViewController(_ uiViewController: MainProvider.ContaiterView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainProvider.ContaiterView>) {
        }
    }
}
