//
//  ViewController.swift
//  FoodApp
//
//  Created by Cassandra Zuria on 2/12/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var dataSource = [MenuItem]()
   
    lazy var menuItemsCollectionView: UICollectionView = { // move implementation 
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 8, right: 16)
        layout.itemSize = CGSize(width: view.bounds.size.width - 32, height: 200)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 6.0
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isUserInteractionEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.addBorder(toSide: .Top, withColor: UIColor.black.cgColor, andThickness: 10) // ??
        return collectionView
    }()
    
    lazy var categoriesCollectionView: UICollectionView = { // move implementation
        var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 8, right: 16)
        layout.itemSize = CGSize(width: view.bounds.size.width / 5, height: 50)
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isUserInteractionEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "ChowDown"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        }
    
    func setupUI() {
        view.backgroundColor = .white
        
        menuItemsCollectionView.register(UINib(nibName: "MenuItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MenuItemCollectionViewCell.reuseID)
        categoriesCollectionView.register(UINib(nibName: "MenuItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MenuItemCollectionViewCell.reuseID)
        
        view.addSubview(categoriesCollectionView)
        view.addSubview(menuItemsCollectionView)
        
        view.addConstraints([
            categoriesCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 150),
            menuItemsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuItemsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuItemsCollectionView.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor),
            menuItemsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            if collectionView == self.menuItemsCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCollectionViewCell.reuseID, for: indexPath) as! MenuItemCollectionViewCell
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCollectionViewCell.reuseID, for: indexPath) as! MenuItemCollectionViewCell
                return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // let item = dataSource.item(at: indexPath.row)
        let detailViewController = MenuItemDetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
