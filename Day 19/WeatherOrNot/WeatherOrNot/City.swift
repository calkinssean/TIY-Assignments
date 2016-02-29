//
//  City.swift
//  WeatherOrNot
//
//  Created by Sean Calkins on 2/25/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import UIKit

class City {
    var formatted_address: String = ""
    var longitude: Double = 0.0
    var latitude: Double = 0.0
    var weatherArray = [Weather]()
    var temperature: Double = 0.0
    var summary: String = ""
    var icon: String = ""
    
    init() {
        
    }
    
    init(dict: JSONDictionary) {
        if let temperature = dict["temperature"] as? Double {
            self.temperature = temperature
        } else {
            print("couldn't parse temperature")
        }
        if let summary = dict["summary"] as? String {
            self.summary = summary
        } else {
            print("couldn't parse summary")
        }
        if let icon = dict["icon"] as? String {
            self.icon = icon
        } else {
            print("couldn't parse icon")
        }
    }
}