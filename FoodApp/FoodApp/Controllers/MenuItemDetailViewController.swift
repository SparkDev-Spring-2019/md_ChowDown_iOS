//
//  MenuItemDetailViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 3/15/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

protocol Pages {}

class MenuItemDetailViewController: UIViewController {
    
    //MARK: Variables
    var pages =  [Pages]()
    
//    var menuItem =  MenuItem()
    
    var selectedSegmentIndex: Int {
        return segmentedControl.selectedSegmentIndex
    }
    
    var pagingForward: Bool {
        return selectedViewController < selectedSegmentIndex
    }
    
    var selectedViewController = 0
    
    // MARK: UI Elements
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "pizzapic")
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        imageView.contentMode = .scaleAspectFit // might need to comment out
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pizza"
        return label
    }()
    
    lazy var ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "⭐️ 4.5(12)"
        return label
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Order", "Description", "Ratings"])
        segmentedControl.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, ratingsLabel, segmentedControl])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 8
        return stackView
    }()
 
    // MARK: Controllers
    private lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                      navigationOrientation: .horizontal,
                                                      options: nil)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return pageViewController
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setPages()
        
        pageViewController.setViewControllers([pages[selectedSegmentIndex] as! UIViewController], direction: .forward, animated: true)
    }
    
    // MARK: Setup
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        view.addSubview(pageViewController.view)
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        
        view.addConstraints([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -2),
            pageViewController.view.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 2),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func setPages() {
//        pages.append(OrderViewController(item: MenuItem()))
        pages.append(DescriptionViewController())
        pages.append(RatingsViewController())
    }
    
    // MARK: Actions
    @objc func valueChanged(_ sender: UISegmentedControl) {
        if pagingForward {
            pageViewController.setViewControllers([pages[selectedSegmentIndex] as! UIViewController], direction: UIPageViewController.NavigationDirection.forward, animated: true)
        } else {
            pageViewController.setViewControllers([pages[selectedSegmentIndex] as! UIViewController], direction: UIPageViewController.NavigationDirection.reverse, animated: true)
        }
        selectedViewController = selectedSegmentIndex
    }
}
