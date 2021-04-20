//
//  SearchCollectionViewCell.swift
//  TestTaskLeroyMerlin
//
//  Created by admin on 19.04.2021.
//

import UIKit


class SearchCollectionViewCell: UICollectionViewCell {
//MARK: - IBOutlets
    @IBOutlet var searchBarView: UISearchBar!
    @IBOutlet var barcodeButton: UIButton!
//MARK: - property
    static let reuseID = "SearchCollectionViewCell"
//MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configView()

    }
//MARK: - private func
    private func configView() {
        searchBarView.layer.cornerRadius = 5
        searchBarView.clipsToBounds = true
        barcodeButton.layer.cornerRadius = 5
        barcodeButton.clipsToBounds = true
    }

}
