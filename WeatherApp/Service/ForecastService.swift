//
//  ForecastService.swift
//  WeatherApp
//
//  Created by Ali Gungor on 1.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class ForecastService {

    static func getForecast(for city: String,
                            successful: @escaping (([Report], City)->()),
                            failure: @escaping ((String)->())) {
        guard let cityQuery = city.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics) else {
            failure("Enter a valid city.")
            return
        }
        let url = "http://api.openweathermap.org/data/2.5/forecast?q=" + cityQuery + "&units=metric&APPID=8827fbf408dc7e1418f3c1e84596334c"
        RestfulService.shared.getRequest(url: url, successful: { (data) in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            if let response = try? decoder.decode(ForecastResponse.self, from: data) {
                successful(response.list, response.city)
            } else {
                failure("No results found.")
            }
        }, failure: failure)
    }
    
}
