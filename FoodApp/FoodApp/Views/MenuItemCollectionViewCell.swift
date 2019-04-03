//
//  CustomCollectionViewCell.swift
//  FoodApp
//
//  Created by gnoa001 on 2/21/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: Reuse ID
    static let reuseID = String(describing: MenuItemCollectionViewCell.self)
    
    // MARK: Outlets
    @IBOutlet weak var foodItemImageView: UIImageView!
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var estimatedTimeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    // MARK: Setup
    func setupUI() {
        backgroundColor = .white
        
        setupImageView()
        setupLayer()
        setupFonts()
        
        foodTypeLabel.textColor = UIColor.gray
    }
    
    func setupImageView() {
        foodItemImageView.layer.cornerRadius = 16.0
        foodItemImageView.layer.masksToBounds = true
        foodItemImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        foodItemImageView.contentMode = .scaleAspectFill
    }
    
    func setupLayer() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 3.0)
        layer.shadowRadius = 5
        layer.cornerRadius = 16
        layer.masksToBounds = false
    }
    
    func setupFonts() {
        foodTitleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        foodTypeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        estimatedTimeLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        ratingLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        priceLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
    }

    var item: MenuItem? {
        didSet {
            foodTitleLabel.text = item?.name
            foodTypeLabel.text = "Category"
            estimatedTimeLabel.text = item?.completionTime
            ratingLabel.text = item?.rating
            priceLabel.text = item?.price
        }
    }
    
}
