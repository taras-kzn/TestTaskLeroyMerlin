//
//  CatalogCollectionViewCell.swift
//  TestTaskLeroyMerlin
//
//  Created by admin on 19.04.2021.
//

import UIKit

class BestPriceViewCell: UICollectionViewCell {
//MARK: - IBOutlets
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var catalogImageView: UIImageView!
    
//MARK: - Property
    static let reuseID = "CatalogCollectionViewCell"
//MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        descriptionLabel.text = nil
        catalogImageView.image = nil
        priceLabel.text = nil
    }
//MARK: - Config func
    private func configView() {
        self.backgroundColor = .black
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        self.backgroundColor = .darkGray
    }
//MARK: - func
    func configure(section: ItemModel) {
        catalogImageView.image = UIImage(named: section.image)
        priceLabel.text = "\(section.price) р/шт."
        descriptionLabel.text = section.description
    }
}
