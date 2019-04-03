//
//  OrderViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 3/21/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, Pages {
    
    // MARK: Variables
    private var menuItem: MenuItem?
    
    private var isOrderButtonOn = false
    
    // MARK: UI Elements
    private lazy var orderButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.setTitle("Add to Order", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 25 //(view.frame.size.height / 2)
        button.addTarget(self, action: #selector(orderButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sizeStackView, quantityStackView, orderButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    // MARK: Size
    private lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Size"
        return label
    }()
    
    private lazy var sizeControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Small", "Medium", "Large"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var sizeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sizeLabel, sizeControl])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 2
        return stackView
    }()
    
    // MARK: Quantity
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Quantity"
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private var stepperValue: Int = 0 {
        didSet {
            stepperValueLabel.fadeTransition(0.1)
            stepperValueLabel.text = String(stepperValue)
        }
    }
    
    private lazy var stepperValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        return label
    }()
    
    private lazy var quantityStepper: UIStepper = {
       let stepper = UIStepper()
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        stepper.stepValue = 1
        stepper.minimumValue = 1
        stepper.maximumValue = 4
        return stepper
    }()
    
    private lazy var stepperStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stepperValueLabel, quantityStepper])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var quantityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [quantityLabel, stepperStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        return stackView
    }()
    
    // MARK: init
    init(item: MenuItem) {
        menuItem = item
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        setupUI()
        view.backgroundColor = .white
    }
    
    // MARK: Setup
    func setupUI() {
        let layoutGuide = view.safeAreaLayoutGuide
        view.addConstraints([
            sizeControl.heightAnchor.constraint(equalToConstant: 30),
            stepperValueLabel.widthAnchor.constraint(equalToConstant: 10),
            stackView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -16),
            orderButton.heightAnchor.constraint(equalToConstant: 50),
            orderButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2).rounded())
            ])
    }
    
    // MARK: Helpers
    func activateButton(bool: Bool) {
        isOrderButtonOn = bool
        let orange = UIColor.customOrange
        let color = bool ? orange : UIColor.white
        let title = bool ? "Item Added to Order": "Add to Order"
        let titleColor = bool ? UIColor.lightText : UIColor.gray
        
        UIView.animate(withDuration: 0.4) {
            self.orderButton.setTitle(title, for: .normal)
            self.orderButton.setTitleColor(titleColor, for: .normal)
            self.orderButton.backgroundColor = color
        }
    }
    
    // MARK: Actions
    @objc func stepperValueChanged(_ sender: UIStepper) {
        stepperValue = Int(sender.value)
    }
    
    @objc func orderButtonTapped(_ sender: UIButton) {
        activateButton(bool: !isOrderButtonOn)
    }
}
