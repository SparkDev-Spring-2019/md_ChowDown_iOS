//
//  HomeViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 2/21/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupControllers()
    }
    
    // MARK: Setup
    func setupControllers() {
        
        let shoppingCart = ShoppingCartViewController()
        shoppingCart.tabBarItem.image = UIImage(named: "cart")
        
        let viewControllerArray: [UIViewController] =   [HomeViewController(), shoppingCart, ProfileViewController()]
        
        let navigationControllers = viewControllerArray.map { UINavigationController(rootViewController: $0)}
        viewControllers = navigationControllers
    }
}
