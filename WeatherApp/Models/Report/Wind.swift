//
//  Wind.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class Wind: Codable {

    var speed = 0.0
    var deg = 0.0
    
    var properties: [ReportProperty] {
        return [
            ReportProperty(name: "Speed", value: String(format: "%0.2f", speed)),
            ReportProperty(name: "Deggree", value: String(format: "%0.2f", deg))
        ]
    }
    
}
