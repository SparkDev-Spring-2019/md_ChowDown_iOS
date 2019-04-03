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
   
   
    
    lazy var categoriesCollectionView: UICollectionView = { // move implementation
        var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: (view.bounds.size.width / 5).rounded(), height: 46)
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.borderWidth = 0.5
        collectionView.layer.borderColor = UIColor.lightGray.cgColor
        collectionView.layer.masksToBounds = false
        collectionView.layer.shadowColor = UIColor.black.cgColor
        collectionView.layer.shadowOpacity = 0.8
        collectionView.layer.shadowOffset = CGSize(width: 0, height: -3.0)
        collectionView.layer.shadowRadius = 5
        return collectionView
    }()
    
    lazy var menuItemsCollectionView: UICollectionView = { // move implementation
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        layout.itemSize = CGSize(width: view.bounds.size.width - 32, height: 200)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 6.0
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isUserInteractionEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        title = "Home"
        navigationItem.title = "ChowDown"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        menuItemsCollectionView.register(UINib(nibName: "MenuItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MenuItemCollectionViewCell.reuseID)
        categoriesCollectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseID)
//        categoriesCollectionView.register(UINib(nibName: "MenuItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MenuItemCollectionViewCell.reuseID)

        view.addSubview(menuItemsCollectionView)
        view.addSubview(categoriesCollectionView)

        let margins = view.layoutMarginsGuide
        view.addConstraints([
            categoriesCollectionView.topAnchor.constraint(equalTo: margins.topAnchor),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -2),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 2),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 64),
            menuItemsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuItemsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuItemsCollectionView.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 4),
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
            } else { // categoriesCollectionView
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseID, for: indexPath) as! CategoriesCollectionViewCell
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCollectionViewCell.reuseID, for: indexPath) as! MenuItemCollectionViewCell
                return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // let item = dataSource.item(at: indexPath.row)
        let detailViewController = MenuItemDetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
        
        // else if categories, reload collectionview
    }
}
