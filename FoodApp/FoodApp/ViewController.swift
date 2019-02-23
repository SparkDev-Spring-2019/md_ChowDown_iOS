//
//  ViewController.swift
//  FoodApp
//
//  Created by Cassandra Zuria on 2/12/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    lazy var collectionView: UICollectionView = {
        var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: view.bounds.size.width - 40, height: 200)
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.blue
        
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        
        view.addSubview(collectionView)
        
        view.addConstraints([
            collectionView.leftAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}
    

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = .red
        //cell.y.isOn = true
        cell.x.titleLabel?.text = "aaaa"
        cell.z.text = "av"
        return cell
    }
    
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        return 1
    //    }
}
