//
//  SectionHeaderView.swift
//  TestTaskLeroyMerlin
//
//  Created by admin on 19.04.2021.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
//MARK: - Property
    static let reuseID = "SectionHeaderView"
    let title = UILabel()
//MARK: - Lif cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configElements()
        setupConstraints()
    }
    
    private func configElements() {
        title.textColor = .black
        title.font = UIFont(name: "Header", size: 30)
        title.translatesAutoresizingMaskIntoConstraints = false
    }
//MARK: - private func
    private func setupConstraints() {
        addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
