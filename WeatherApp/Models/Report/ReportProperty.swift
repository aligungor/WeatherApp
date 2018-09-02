//
//  ReportProperty.swift
//  WeatherApp
//
//  Created by Ali Gungor on 2.09.2018.
//  Copyright © 2018 Ali Gungor. All rights reserved.
//

import UIKit

class ReportProperty {

    var name = ""
    var value = ""
    
    private init() {
    }
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
    
}
