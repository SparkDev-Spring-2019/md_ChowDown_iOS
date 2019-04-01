//
//  ProfileViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 3/15/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ProfileViewController: UIViewController {
    
    // MARK: Variables
    private lazy var profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
//        let image = UIImage(named: "woman")!
//        imageView.maskCircle(anyImage: image)
        imageView.image = #imageLiteral(resourceName: "woman")
//        imageView.layer.cornerRadius = (imageView.frame.size.width / 2).rounded()
//        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    // MARK: Label Names
    private lazy var firstNameTextField: SkyFloatingLabelTextField = {
        let sky = SkyFloatingLabelTextField()
        sky.textColor = UIColor.darkGray
        sky.placeholder = "First Name"
        sky.text = "Michael"
        sky.title = "First Name"
        sky.placeholderColor = .lightGray
        sky.titleColor = .customOrange
        sky.lineColor = .darkGray
        sky.selectedLineColor = .customOrange
        sky.selectedTitleColor = .customOrange
        return sky
    }()
    
    private lazy var lastNameTextField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.textColor = UIColor.darkGray
        textField.placeholder = "First Name"
        textField.text = "Scott"
        textField.title = "Last Name"
        textField.placeholderColor = .lightGray
        textField.titleColor = .customOrange
        textField.lineColor = .darkGray
        textField.selectedLineColor = .customOrange
        textField.selectedTitleColor = .customOrange
        return textField
    }()
    
    private lazy var emailTextField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.textColor = UIColor.darkGray
        textField.adjustsFontSizeToFitWidth = true
        textField.placeholder = "Email"
        textField.text = "MikeScott@dundermifflin.com"
        textField.title = "Email"
        textField.placeholderColor = .lightGray
        textField.titleColor = .customOrange
        textField.lineColor = .darkGray
        textField.selectedLineColor = .customOrange
        textField.selectedTitleColor = .customOrange
        return textField
    }()
    
    private lazy var addressTextField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.textColor = UIColor.darkGray
        textField.adjustsFontSizeToFitWidth = true
        textField.placeholder = "Address"
        textField.text = "11200 SW 8th St, Miami, FL 33199"
        textField.title = "Address"
        textField.placeholderColor = .lightGray
        textField.titleColor = .customOrange
        textField.lineColor = .darkGray
        textField.selectedLineColor = .customOrange
        textField.selectedTitleColor = .customOrange
        return textField
    }()
    
    private lazy var passwordTextField: SkyFloatingLabelTextField = {
        let textField = SkyFloatingLabelTextField()
        textField.isSecureTextEntry = true
        textField.textColor = UIColor.darkGray
        textField.adjustsFontSizeToFitWidth = true
        textField.placeholder = "Password"
        textField.text = ""
        textField.title = "Password"
        textField.placeholderColor = .lightGray
        textField.titleColor = .customOrange
        textField.lineColor = .darkGray
        textField.selectedLineColor = .customOrange
        textField.selectedTitleColor = .customOrange
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .customOrange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.setTitle("Save Changes", for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstNameTextField, lastNameTextField, emailTextField, addressTextField, passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.spacing = 32
        return stackView
    }()
    
    // MARK: init
    init() {
        super.init(nibName: nil, bundle: nil)
        
        title = "Profile"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        addressTextField.delegate = self
        passwordTextField.delegate = self
        setupUI()
    }
    
    // address email pw
    
    // MARK: Setup
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(profileImageView)
        view.addSubview(stackView)
        view.addSubview(saveButton)
        
        let safeArea = view.safeAreaLayoutGuide
        view.addConstraints([
            //firstNameLabel.heightAnchor.constraint(equalToConstant: 30),
            //profileImageView.heightAnchor.constraint(equalToConstant: (view.bounds.height / 4).rounded()),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 55),
            firstNameTextField.widthAnchor.constraint(equalToConstant: 230),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 55),
            lastNameTextField.widthAnchor.constraint(equalToConstant: 230),
            emailTextField.heightAnchor.constraint(equalToConstant: 55),
            emailTextField.widthAnchor.constraint(equalToConstant: 230),
            passwordTextField.heightAnchor.constraint(equalToConstant: 55),
            passwordTextField.widthAnchor.constraint(equalToConstant: 230),
            addressTextField.heightAnchor.constraint(equalToConstant: 55),
            addressTextField.widthAnchor.constraint(equalToConstant: 230),
            profileImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 24),
            profileImageView.leadingAnchor.constraint(greaterThanOrEqualTo: safeArea.leadingAnchor),
            profileImageView.trailingAnchor.constraint(lessThanOrEqualTo: safeArea.trailingAnchor),
            profileImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            stackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.widthAnchor.constraint(equalToConstant: 140)
            ])
    }
    
    @objc func saveButtonTapped(_ sender: UIButton) {
        
    }
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
