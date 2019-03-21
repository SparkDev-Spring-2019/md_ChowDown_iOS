//
//  Extensions.swift
//  FoodApp
//
//  Created by gnoa001 on 3/18/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import Foundation
import UIKit

class GenericTableViewCell<view: UIView>: UITableViewCell {
    
    var cellView: UIView? {
        didSet {
            //
        }
    }
    
    private func setupViews() {
        guard let cellView = cellView else { return }
        
        contentView.addSubview(cellView)
        // pin edges to superview
    }
}

extension UITableViewCell { // not sure which class is best yet
    func pinEdgesToSuperView() {
        contentView.addConstraints([
            
            ])
    }
}
