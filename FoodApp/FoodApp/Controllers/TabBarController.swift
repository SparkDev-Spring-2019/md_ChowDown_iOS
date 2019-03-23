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

        let firstViewController = HomeViewController()
        //firstViewController.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        
        let secondViewController = SearchViewController()
       // secondViewController.tabBarItem = UITabBarItem(title: "Search", image: nil, tag: 1)
        
        let thirdViewController = ShoppingCartViewController()
        //thirdViewController.tabBarItem = UITabBarItem(title: "Shopping Cart", image: nil, tag: 2)
        
        let fourthViewController = ProfileViewController()
       // fourthViewController.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 3)
        
        let viewControllersList = [firstViewController, secondViewController, thirdViewController, fourthViewController]
        let navigationControllers = viewControllersList.map { UINavigationController(rootViewController: $0)}
        viewControllers = navigationControllers
    }
}
