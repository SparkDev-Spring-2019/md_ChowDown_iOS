//
//  CustomCollectionViewCell.swift
//  FoodApp
//
//  Created by gnoa001 on 2/21/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

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
    }
    
}
