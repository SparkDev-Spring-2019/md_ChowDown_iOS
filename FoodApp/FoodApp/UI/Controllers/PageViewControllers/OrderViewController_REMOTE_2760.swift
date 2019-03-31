//
//  OrderViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 3/21/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    private var menuItem: MenuItem

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
//    init(item: MenuItem) {
//        super.init(nibName: nil, bundle: nil)
//         menuItem = item
//    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    init(item: MenuItem) {
//        menuItem = item
//
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
