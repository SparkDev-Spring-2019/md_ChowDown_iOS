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
    
    // MARK: Reuse ID
    static let reuseID = String(describing: CategoriesCollectionViewCell.self)

    public lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Y"
        contentView.addSubview(label)
        return label
    }()
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    func setupUI() {
        let margins = contentView.layoutMarginsGuide
        contentView.addConstraints([
            categoryTitleLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            categoryTitleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: margins.leadingAnchor),
            categoryTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: margins.trailingAnchor),
            categoryTitleLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
            ])
       
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.3
    }
    
    var category: MenuCategory? {
        didSet {
           categoryTitleLabel.text = category?.categoryId
        }
    }
}

