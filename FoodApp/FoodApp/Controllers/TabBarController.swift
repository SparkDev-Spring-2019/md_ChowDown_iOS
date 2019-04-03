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
        
        let home = HomeViewController()
        home.tabBarItem.image = UIImage(named: "home")
        
        let shoppingCart = ShoppingCartViewController()
        shoppingCart.tabBarItem.image = UIImage(named: "cart")
        
        let profile = ProfileViewController()
        profile.tabBarItem.image = UIImage(named: "user")
        
        let viewControllerArray: [UIViewController] =   [home, shoppingCart,profile]
        
        let navigationControllers = viewControllerArray.map { UINavigationController(rootViewController: $0)}
        viewControllers = navigationControllers
    }
}
