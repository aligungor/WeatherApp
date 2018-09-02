//
//  Report.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class Report: Codable {

    var dt: Double = 0
    var main = Main()
    var weather = [Weather]()
    var clouds = Clouds()
    var wind = Wind()
    var dtTxt = ""
    
    private var date: Date {
        return Date(timeIntervalSince1970: dt)
    }
    
    var dateString: String {
        return date.string(forDateFormat: "dd.MM.yyyy")
    }
    
    var weekDay: String {
        return date.string(forDateFormat: "EEEE")
    }
    
    var startTime: String {
        return date.string(forDateFormat: "HH:mm")
    }
    
    var endTime: String {
        return date.add(hours: 3).string(forDateFormat: "HH:mm")
    }
    
}
