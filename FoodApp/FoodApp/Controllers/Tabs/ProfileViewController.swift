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
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = #imageLiteral(resourceName: "woman")
        return image
    }()
    
    // MARK: Label Names
    private lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "First Name"
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Last Name"
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .lightGray
        return label
    }()
    
    // MARK: Label Values
    var firstNameValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Michael"
        return label
    }()
    
    var lastNameValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Scott"
        return label
    }()
    
    var emailValueLabel: UILabel = {
        let label = UILabel()
        label.text = "me@you.com"
        return label
    }()
    
    var userNameValueLabel: UILabel = {
        let label = UILabel()
        label.text = "MikeScott1024"
        return label
    }()

    // MARK: Label StackViews
    private lazy var leftStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [firstNameLabel, lastNameLabel, userNameLabel, emailLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.distribution = .fillEqually
        stackView.spacing = 32
        
        return stackView
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstNameValueLabel, lastNameValueLabel, emailValueLabel, userNameValueLabel])
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

        setupUI()
    }
    
    // MARK: Setup
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(profileImageView)
        view.addSubview(leftStackView)
        view.addSubview(rightStackView)
        
        let safeArea = view.safeAreaLayoutGuide
        view.addConstraints([
            //firstNameLabel.heightAnchor.constraint(equalToConstant: 30),
            //profileImageView.heightAnchor.constraint(equalToConstant: (view.bounds.height / 4).rounded()),
            profileImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 24),
            profileImageView.leadingAnchor.constraint(greaterThanOrEqualTo: safeArea.leadingAnchor),
            profileImageView.trailingAnchor.constraint(lessThanOrEqualTo: safeArea.trailingAnchor),
            profileImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),

            leftStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 48),
            leftStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            leftStackView.widthAnchor.constraint(equalToConstant: ((UIScreen.main.bounds.width / 2) - 8).rounded()),
            rightStackView.topAnchor.constraint(equalTo: leftStackView.topAnchor),
            rightStackView.leadingAnchor.constraint(equalTo: leftStackView.trailingAnchor, constant: 16),
            rightStackView.widthAnchor.constraint(equalTo: leftStackView.widthAnchor)
            ])
    }
}
