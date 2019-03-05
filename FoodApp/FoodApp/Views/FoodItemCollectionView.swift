//
//  FoodItemCollectionView.swift
//  FoodApp
//
//  Created by gnoa001 on 2/28/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class FoodItemCollectionView: UIView {
    lazy var flowLayout: UICollectionViewFlowLayout = {
        var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 8, right: 16)
        layout.itemSize = CGSize(width: self.bounds.size.width - 32, height: 200)
        return layout
    }()
    
    public lazy var collectionView: UICollectionView = {
        
    
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .red
        collectionView.layer.cornerRadius = 6.0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")

        self.addSubview(collectionView)
        self.backgroundColor = .gray

        setupCollectionViewConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addSubview(collectionView)
        setupCollectionViewConstraints()
    }
    
    func setupCollectionViewConstraints() {
        self.addConstraints([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
}
