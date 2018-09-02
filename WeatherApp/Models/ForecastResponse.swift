//
//  ForecastResponse.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class ForecastResponse: Codable {
    
    var cod = ""
    var message = 0.0
    var cnt = 0
    var list = [Report]()
    var city = City()
    
}
