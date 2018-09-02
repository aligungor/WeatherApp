//
//  UIImageView+Extensions.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func loadURL(url: URL) {
        kf.indicatorType = .activity
        kf.setImage(with: url)
    }
    
}
