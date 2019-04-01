//
//  Extensions.swift
//  FoodApp
//
//  Created by gnoa001 on 3/18/19.
//  Copyright © 2019 SparkDev. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static let customGray = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
    
    static let customOrange = UIColor(red: 241.0 / 255.0, green: 81 / 255.0, blue: 34.0 / 255.0, alpha: 1)
    
    static let customRed = UIColor(red: 230 / 255.0, green: 0, blue: 0, alpha: 1.0)
}

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}

extension UIImageView {
    public func maskCircle(anyImage: UIImage) {
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        
        // make square(* must to make circle),
        // resize(reduce the kilobyte) and
        // fix rotation.
        self.image = anyImage
    }
}
