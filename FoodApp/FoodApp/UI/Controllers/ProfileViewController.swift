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

    private lazy var profileImageView: UIImageView = {
       let image = UIImageView()
        image.image = #imageLiteral(resourceName: "pizzapic")
        return image
    }()
    
    private lazy var firstNameLabel: SkyFloatingLabelTextField = {
        let label = SkyFloatingLabelTextField()
        label.placeholder = "First Name"
//        label.title = "First Name"
        label.selectedTitle = "First Name"
        return label
    }()
    
    private lazy var lastNameLabel: SkyFloatingLabelTextField = {
        let label = SkyFloatingLabelTextField()
        label.placeholder = "Last Name"
        label.selectedTitle = "Last Name"
        return label
    }()
    
    private lazy var userNameLabel: SkyFloatingLabelTextField = {
        let label = SkyFloatingLabelTextField()
        label.placeholder = "Username"
        label.selectedTitle = "Username"
        return label
    }()
    
     lazy var emailLabel: SkyFloatingLabelTextField = {
        let label = SkyFloatingLabelTextField()
        label.placeholder = "Email"
        label.selectedTitle = "Email"
        return label
    }()
    
    private lazy var passwordLabel: SkyFloatingLabelTextField = {
        let label = SkyFloatingLabelTextField()
        label.placeholder = "Password"
        label.selectedTitle = "Password"
        return label
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [profileImageView, firstNameLabel, lastNameLabel, userNameLabel, emailLabel, passwordLabel, saveButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 8
        return stackView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        title = "Profile"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white

        view.addSubview(stackView)
        view.addConstraints([
            profileImageView.heightAnchor.constraint(equalToConstant: (view.bounds.height / 4).rounded()),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    @objc func saveButtonTapped(_ sender: UIButton) {
        
    }
}
