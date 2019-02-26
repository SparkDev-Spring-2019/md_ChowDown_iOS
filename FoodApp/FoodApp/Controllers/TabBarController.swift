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

        // Do any additional setup after loading the view.
        let firstViewController = HomeViewController()
        
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        let secondViewController = HomeViewController()
        
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        let thirdViewController = HomeViewController()
        
        thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        
        let fourthViewController = HomeViewController()
        
        fourthViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 3)
        
        viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController]
    }
    
}
