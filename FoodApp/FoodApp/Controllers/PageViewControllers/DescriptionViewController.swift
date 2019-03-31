//
//  DescriptionViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 3/21/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController, Pages {
    
    // MARK: Variables
    private lazy var descriptionLabel: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Our 12-inch special-recipe pizza, featuring our traditional crispy crust, is topped with a blend of mozzarella and cheddar cheese, zesty pepperoni slices and a rich tomato sauce. No artificial flavors. Made with 100% real cheese."
        textView.font = UIFont.preferredFont(forTextStyle: .footnote)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 12
        let attributes = [NSAttributedString.Key.paragraphStyle : style]
        textView.attributedText = NSAttributedString(string: textView.text, attributes: attributes)
        return textView
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: Setup
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(descriptionLabel)
        
        let safeArea = view.safeAreaLayoutGuide
        view.addConstraints([
            descriptionLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            ])
    }
    
    // MARK: Helpers
    func configure(description: String) {
        descriptionLabel.text = description
    }
}
