//
//  CityCache.swift
//  WeatherApp
//
//  Created by Ali Gungor on 2.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class CityCache {

    static let shared = CityCache()
    
    private let defaults = UserDefaults.standard
    
    var cities: [String] {
        let cache = defaults.array(forKey: "cities") as? [String] ?? [String]()
        return cache.reversed()
    }
    
    func add(city: String) {
        var cache = cities
        if let index = cache.index(where: { $0.lowercased() == city.lowercased() }) {
            cache.remove(at: index)
        }
        cache.append(city)
        defaults.set(cache, forKey: "cities")
        defaults.synchronize()
    }
    
    func remove(city: String) {
        var cache = cities
        if let index = cache.index(where: { $0.lowercased() == city.lowercased() }) {
            cache.remove(at: index)
            defaults.set(cache, forKey: "cities")
            defaults.synchronize()
        }
    }
    
}
