//
//  ViewController.swift
//  FoodApp
//
//  Created by Cassandra Zuria on 2/12/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Variables
    var dataSource = [MenuItem]()
    
    var selectedIndexPath: IndexPath?
    
    let categories = ["ALL", "BREAKFAST", "LUNCH", "DINNER", "DESSERT", "PASTRIES"]
   
    // MARK: UI Elements
    lazy var categoriesCollectionView: UICollectionView = { 
        var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = CGSize(width: 40, height: 30)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.masksToBounds = false
        collectionView.layer.shadowColor = UIColor.black.cgColor
        collectionView.layer.shadowOpacity = 0.3
        collectionView.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        collectionView.layer.shadowRadius = 5
        return collectionView
    }()
    
    lazy var menuItemsCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumLineSpacing = 16
        layout.itemSize = CGSize(width: view.bounds.size.width - 32, height: 240)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavBar()
    }
    
    //MARK: Setup
    func setupUI() {
        view.backgroundColor = .white
        
        menuItemsCollectionView.register(UINib(nibName: "MenuItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MenuItemCollectionViewCell.reuseID)
        categoriesCollectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseID)
        
        view.addSubview(menuItemsCollectionView)
        view.addSubview(categoriesCollectionView)
        
        let layoutGuide = view.safeAreaLayoutGuide
        view.addConstraints([
            categoriesCollectionView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 64),
            menuItemsCollectionView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            menuItemsCollectionView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            menuItemsCollectionView.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor),
            menuItemsCollectionView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)
            ])
    }
    
    func setupNavBar() {
        title = "Home"
        navigationItem.title = "ChowDown"
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: CollectionView Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.menuItemsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCollectionViewCell.reuseID, for: indexPath) as! MenuItemCollectionViewCell
            cell.foodItemImageView.image = #imageLiteral(resourceName: "pizzapic")
            return cell
        } else if collectionView == categoriesCollectionView { // categoriesCollectionView
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseID, for: indexPath) as! CategoriesCollectionViewCell
            cell.categoryTitleLabel.text = categories[indexPath.row % categories.count]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == menuItemsCollectionView {
            let detailViewController = MenuItemDetailViewController()
            navigationController?.pushViewController(detailViewController, animated: true)
        } else if collectionView == categoriesCollectionView {
          
            let cell = collectionView.cellForItem(at: indexPath) as! CategoriesCollectionViewCell
            cell.contentView.backgroundColor = UIColor.customOrange
            
            if let selectedIdx = selectedIndexPath, selectedIdx != indexPath {
                let selectedCell = collectionView.cellForItem(at: selectedIdx) as! CategoriesCollectionViewCell
                selectedCell.contentView.backgroundColor = .clear
            }
            selectedIndexPath = indexPath
        }
    }
}
