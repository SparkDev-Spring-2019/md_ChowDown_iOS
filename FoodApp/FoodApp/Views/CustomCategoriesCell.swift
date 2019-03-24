//
//  CustomCategoriesCell.swift
//  FoodApp
//
//  Created by gnoa001 on 3/23/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import Foundation
import UIKit

class CustomCategoriesCell: UICollectionViewCell {
    
    lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Yah Yeet"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(categoryTitleLabel)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        contentView.addConstraints([
            categoryTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
}
