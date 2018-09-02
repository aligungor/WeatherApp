//
//  Date+Extensions.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

extension Date {
    
    func string(forDateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func add(hours: Double) -> Date {
        return addingTimeInterval(hours * 60.0 * 60.0)
    }
    
}
