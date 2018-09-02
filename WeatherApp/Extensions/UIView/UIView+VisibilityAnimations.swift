//
//  UIView+VisibilityAnimations.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

extension UIView {
    
    func hide(animated: Bool = false, animationDuration: Double = 0.4) {
        if !animated {
            self.isHidden = true
            self.alpha = 0.0
            return
        }
        
        self.isHidden = false
        self.alpha = 1.0
        UIView.animate(withDuration: animationDuration, animations: {
            self.alpha = 0.0
        }, completion: { (_) in
            self.isHidden = true
        })
    }
    
    func show(animated: Bool = false, animationDuration: Double = 0.4) {
        if !animated {
            self.isHidden = false
            self.alpha = 1.0
            return
        }
        
        self.isHidden = false
        self.alpha = 0.0
        UIView.animate(withDuration: animationDuration, animations: {
            self.alpha = 1.0
        })
    }
    
}
