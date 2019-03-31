//
//  LoginViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 3/31/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {
    
    // MARK: UI Elements
    private lazy var chowDown: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textColor = .darkGray
        label.text = "ChowDown"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logo")
        return imageView
    }()

    private lazy var emailTextField: SkyFloatingLabelTextField = {
       let sky = SkyFloatingLabelTextField()
        sky.textColor = UIColor.darkGray
        sky.placeholder = "Email"
        sky.placeholderColor = .lightGray
        sky.titleColor = .customOrange
        sky.lineColor = .darkGray
        sky.selectedLineColor = .customOrange
        sky.selectedTitleColor = .customOrange
        return sky
    }()
    
    private lazy var passwordTextField: SkyFloatingLabelTextField = {
        let sky = SkyFloatingLabelTextField()
        sky.isSecureTextEntry = true
        sky.textColor = UIColor.darkGray
        sky.placeholder = "Password"
        sky.placeholderColor = .lightGray
        sky.titleColor = .customOrange
        sky.lineColor = .darkGray
        sky.selectedLineColor = .customOrange
        sky.selectedTitleColor = .customOrange
        return sky
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .customOrange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [chowDown, imageView, emailTextField, passwordTextField, loginButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.setCustomSpacing(64, after: passwordTextField)
        return stackView
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        setupUI()
    }
    
    // MARK: Setup
    func setupUI() {
        view.backgroundColor = .customGray
       // addGradientLayer()
        view.addSubview(stackView)

        let safeArea = view.safeAreaLayoutGuide
        view.addConstraints([
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            emailTextField.heightAnchor.constraint(equalToConstant: 55),
            emailTextField.widthAnchor.constraint(equalToConstant: 230),
            passwordTextField.heightAnchor.constraint(equalToConstant: 55),
            passwordTextField.widthAnchor.constraint(equalToConstant: 230),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 140),
            stackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100)
            ])
    }

    // MARK: Actions
    @objc func loginButtonTapped(_ sender: UIButton) {
        let tabBarController = TabBarController()
        present(tabBarController, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
