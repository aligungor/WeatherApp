//
//  Main.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class Main: Codable {
    
    var temp = 0.0
    var tempMin = 0.0
    var tempMax = 0.0
    var pressure = 0.0
    var seaLevel = 0.0
    var grndLevel = 0.0
    var humidity = 0
    var tempKf = 0.0
    
    var properties: [ReportProperty] {
        return [
            ReportProperty(name: "Min. Temperature", value: String(format: "%0.2fº", tempMin)),
            ReportProperty(name: "Max. Temperature", value: String(format: "%0.2fº", tempMax)),
            ReportProperty(name: "Pressure", value: String(format: "%0.2f", pressure)),
            ReportProperty(name: "Sea Level", value: String(format: "%0.2f", seaLevel)),
            ReportProperty(name: "Ground Level", value: String(format: "%0.2f", grndLevel)),
            ReportProperty(name: "Humidity", value: String(format: "%%%d", humidity))
        ]
    }
    
}
