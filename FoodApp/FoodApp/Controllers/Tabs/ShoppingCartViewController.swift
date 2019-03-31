//
//  ShoppingCartViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 3/15/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        title = "Shopping Cart"
        navigationItem.title = "Shopping Cart"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}
