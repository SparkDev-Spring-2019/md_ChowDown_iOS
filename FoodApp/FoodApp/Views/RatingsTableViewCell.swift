//
//  RatingsTableViewCell.swift
//  FoodApp
//
//  Created by gnoa001 on 3/30/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class RatingsTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var ratingTitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    // MARK: Setup
    func setupUI() {
        ratingTitleLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        ratingLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        nameLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        textView.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        textView.isUserInteractionEnabled = false
        textView.isScrollEnabled = false
        
        ratingTitleLabel.text = "Amazing!"
        ratingLabel.text = "⭐️⭐️⭐️⭐️"
        dateLabel.text = "9 Mar"
        nameLabel.text = "Quinten Kortum"
        profileImageView.image = #imageLiteral(resourceName: "woman")
        
        dateLabel.textColor = .lightGray
        nameLabel.textColor = .lightGray
    }
}
