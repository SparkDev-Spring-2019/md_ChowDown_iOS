//
//  HomeViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 2/21/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ChowDown"

        let viewControllerArray: [UIViewController] =   [HomeViewController(), SearchViewController(), ShoppingCartViewController(), ProfileViewController()]
        
        let navigationControllers = viewControllerArray.map { UINavigationController(rootViewController: $0)}
        viewControllers = navigationControllers
    }
}
