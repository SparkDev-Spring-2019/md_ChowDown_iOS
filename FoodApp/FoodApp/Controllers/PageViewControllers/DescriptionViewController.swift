//
//  DescriptionViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 3/21/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    private lazy var descriptionLabel: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "askldjaslkjdsadjsajdjaskldjasdklslkadfjklfjdfaladf rhadh jkadfvjkfjadfhvlajf vakdjfh adkjfv aefvh qefkvj qefkjv bqekljvbqefkjvbqefkjfvbnqefkjvb qefkjv bqekjfv bqekjfn d adfl adfkjn dsqdcqwdndc qwdncwcwnd cqkwdjncqwjkdncqudicvgh qhvqljkhvjq evjkddcvjkqebdkjansdbvjkanbdsvjkab dsjvkbad fsjkvbadjkvadskhuaksdnvbajkdsvnafveqfvnkfdvcadfhvsdjkvh asdjkvhad fvlgahsdhvajds k "
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(descriptionLabel)
        
        view.addConstraints([
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func configure(description: String) {
        descriptionLabel.text = description
    }
}
