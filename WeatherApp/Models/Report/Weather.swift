//
//  Weather.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class Weather: Codable {

    var id = 0
    var main = ""
    var description = ""
    var icon = ""
    
    var iconURL: URL {
        return URL.init(string: "http://openweathermap.org/img/w/" + icon + ".png")!
    }
    
}
