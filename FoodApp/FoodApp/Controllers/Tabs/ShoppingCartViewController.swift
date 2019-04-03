//
//  ShoppingCartViewController.swift
//  FoodApp
//
//  Created by gnoa001 on 3/15/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    
    lazy var shoppingCart: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    lazy var priceSummary: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var priceTotalLabel: UILabel = {
        let text = UILabel(frame: .zero)
        text.text = "Total"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var priceTotal: UILabel = {
        let text = UILabel(frame: .zero)
        text.text = "$7.59"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        title = "Shopping Cart"
//        navigationItem.title = "Shopping Cart"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .white
        
        shoppingCart.register(UINib(nibName: ShoppingCartTableViewCell.reuseID, bundle: nil), forCellReuseIdentifier: ShoppingCartTableViewCell.reuseID)
        
        view.addSubview(shoppingCart)
        priceSummary.addSubview(priceTotal)
        priceSummary.addSubview(priceTotalLabel)
        view.addSubview(priceSummary)
        
        
        view.addConstraints([
            shoppingCart.topAnchor.constraint(equalTo: view.topAnchor),
            shoppingCart.bottomAnchor.constraint(equalTo: priceSummary.topAnchor),
            shoppingCart.leftAnchor.constraint(equalTo: view.leftAnchor),
            shoppingCart.rightAnchor.constraint(equalTo: view.rightAnchor),
            priceSummary.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            priceSummary.topAnchor.constraint(equalTo: shoppingCart.bottomAnchor),
            priceSummary.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            priceSummary.leftAnchor.constraint(equalTo: view.leftAnchor),
            priceSummary.rightAnchor.constraint(equalTo: view.rightAnchor),
            priceTotal.rightAnchor.constraint(equalTo: priceSummary.rightAnchor, constant: -30),
            priceTotal.heightAnchor.constraint(equalToConstant: 30),
            priceTotalLabel.leftAnchor.constraint(equalTo: priceSummary.leftAnchor, constant: 30),
            priceTotal.heightAnchor.constraint(equalToConstant: 30),])
        
    }

}

extension ShoppingCartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingCartTableViewCell.reuseID, for: indexPath) as! ShoppingCartTableViewCell
        
        cell.heightAnchor.constraint(equalToConstant: 50)
        
        return cell
    }
    
}

extension ShoppingCartViewController: UITableViewDelegate {
    
}
