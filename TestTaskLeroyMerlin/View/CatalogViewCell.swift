//
//  BestPriceCollectionViewCell.swift
//  TestTaskLeroyMerlin
//
//  Created by admin on 19.04.2021.
//

import UIKit

class CatalogViewCell: UICollectionViewCell {
//MARK: - IBOutlet
    @IBOutlet var priceImageView: UIImageView!
//MARK: - Property
    static let reuseID = "BestPriceCollectionViewCell"
//MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        priceImageView.image = nil
    }
//MARK: - Config func
    private func configView() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.backgroundColor = .blue
    }
//MARK: - func
    func configure(item: ItemModel) {
        priceImageView.image = UIImage(named: item.image)
    }
    
}
