//
//  OrderViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 3/21/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    private var menuItem: MenuItem?
    
    private let sizes = ["Small", "Medium", "Large"]
    
    private lazy var sizeLabel: UITextView = {
        let label = UITextView()
        label.text = "Choose Size"
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private lazy var stepper: UIStepper = {
       let stepper = UIStepper()
        stepper.stepValue = 1
        stepper.minimumValue = 1
        stepper.maximumValue = 4
        return stepper
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sizeLabel, stepper])
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
        
        picker.dataSource = self
        picker.delegate = self
        
        sizeLabel.inputView = picker
    }
    
<<<<<<< HEAD:FoodApp/FoodApp/Controllers/PageViewControllers/OrderViewController.swift
    init(item: MenuItem) {
        menuItem = item
        
        super.init(nibName: nil, bundle: nil)
    }
=======
//    init(item: MenuItem) {
//        super.init(nibName: nil, bundle: nil)
//         menuItem = item
//    }
   
>>>>>>> dev:FoodApp/FoodApp/UI/Controllers/PageViewControllers/OrderViewController.swift
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
           // stackView.pinToEdges()
        view.addConstraints([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func configure(item: MenuItem) {
        menuItem = item
    }
}

extension OrderViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // not sure at all about some of these funcs
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3 // small medium large
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return sizes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textAlignment = .center
        label.text = sizes[row]
        return label
    }
}
