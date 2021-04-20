//
//  ViewController.swift
//  TestTaskLeroyMerlin
//
//  Created by admin on 16.04.2021.
//

import UIKit
import SwiftUI

class TestViewController: UIViewController {
//MARK: - property
    private var collectionView: UICollectionView!
    private let cellId = "cellId"
    private let catalogCell = catalog
//MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
//MARK: - private func
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: TestViewController.createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight ]
        collectionView.backgroundColor = .lightGray
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UINib(nibName: "CatalogViewCell", bundle: nil), forCellWithReuseIdentifier: CatalogViewCell.reuseID)
        navigationItem.title = "Каталог"
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
//MARK: - Setup layout
    static func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvirnment) -> NSCollectionLayoutSection? in
            
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
            item.contentInsets.trailing = 16
            item.contentInsets.bottom = 16
            let grope = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250)), subitems: [item])
            let section = NSCollectionLayoutSection(group: grope)
            section.contentInsets.leading = 16
            
            return section
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
}
//MARK: - extension UICollectionViewDelegate UICollectionViewDataSource
extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catalogCell[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogViewCell.reuseID, for: indexPath) as? CatalogViewCell else { return UICollectionViewCell() }
        let items = catalogCell[indexPath.section].items
        let item = items[indexPath.row]
        cell.configure(item: item)
        return cell
    }
}

// MARK: - SwiftUI
struct TestProvider: PreviewProvider {
    
    static var previews: some View {
        ContaiterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContaiterView: UIViewControllerRepresentable {
        let tabBar = MainTabBarTableViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<TestProvider.ContaiterView>) -> some MainTabBarTableViewController {
            return tabBar
        }
        func updateUIViewController(_ uiViewController: TestProvider.ContaiterView.UIViewControllerType, context: UIViewControllerRepresentableContext<TestProvider.ContaiterView>) {
        }
    }
}


