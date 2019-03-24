//
//  CustomCollectionViewCell.swift
//  FoodApp
//
//  Created by gnoa001 on 2/21/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = String(describing: MenuItemCollectionViewCell.self)
    
    @IBOutlet weak var foodItemImageView: UIImageView!
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var estimatedTimeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.backgroundColor = .white
        
        setupImageView()
    }
    
    func setupImageView() {
        foodItemImageView.layer.cornerRadius = 6.0;
        foodItemImageView.layer.masksToBounds = true
        foodItemImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        backgroundColor = .white
        layer.borderWidth = 0.8
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 6.0
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
    }
    
}
