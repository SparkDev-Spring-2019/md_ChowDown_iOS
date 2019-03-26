//
//  Extensions.swift
//  FoodApp
//
//  Created by gnoa001 on 3/18/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import Foundation
import UIKit

//class GenericTableViewCell<view: UIView>: UITableViewCell {
//
//    var cellView: UIView? {
//        didSet {
//            //
//        }
//    }
//
//    private func setupViews() {
//        guard let cellView = cellView else { return }
//
//        contentView.addSubview(cellView)
//        // pin edges to superview
//    }
//}
//
//extension UITableViewCell { // not sure which class is best yet
//    func pinEdgesToSuperView() {
//        contentView.addConstraints([
//
//            ])
//    }
//}

extension UICollectionView {
    
    // Example use: myView.addBorder(toSide: .Left, withColor: UIColor.redColor().CGColor, andThickness: 1.0)
    
    enum ViewSide {
        case Left, Right, Top, Bottom
    }
    
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height)
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height)
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness)
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness)
        }
        
        layer.addSublayer(border)
    }
}

extension UIView {
    func pinToEdges() {
        if let superView = superview {
            addConstraints([
                self.topAnchor.constraint(equalTo: superView.topAnchor),
                self.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: superView.trailingAnchor),
                self.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
                ])
        }
    }
    
    
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        //layer.shadowOffset =
        layer.shadowRadius = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
