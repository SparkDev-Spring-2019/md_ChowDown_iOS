//
//  CustomCategoriesCell.swift
//  FoodApp
//
//  Created by gnoa001 on 3/23/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import Foundation
import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = String(describing: CategoriesCollectionViewCell.self)

    lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Y"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(categoryTitleLabel)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        let margins = contentView.layoutMarginsGuide
        contentView.addConstraints([
            categoryTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
    
    var category: MenuCategory? {
        didSet {
           categoryTitleLabel.text = category?.categoryId
        }
    }
}
