//
//  OrderViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 3/21/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class OrderPageViewController: UIViewController {
    
    private var menuItem: MenuItem?
    
    private lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private lazy var stepper: UIStepper = {
       let stepper = UIStepper()
        
        return stepper
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [picker, stepper])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 8
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        setupUI()
        view.backgroundColor = .white
    }
    
    init(item: MenuItem) {
        menuItem = item
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        view.addConstraints([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func configure(item: MenuItem) {
        menuItem = item
    }
}
