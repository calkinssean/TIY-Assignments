//
//  Weather.swift
//  WeatherOrNot
//
//  Created by Sean Calkins on 2/25/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import UIKit

class Weather {
    
    var time: Int = 1456545600
    var summary: String = "Mostly Cloudy"
    var icon: String = "partly-cloudy-night"
    var temperatureMin: Double = 57.3
    var temperatureMax: Double = 66.18
    
    
    
    
    init(dict: JSONDictionary) {
        
        if let time = dict["time"] as? Int {
            self.time = time
        } else {
            print("couldn't parse time")
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
        if let temperatureMin = dict["temperatureMin"] as? Double {
            self.temperatureMin = temperatureMin
        } else {
            print("couldn't parse temperatureMin")
        }
        if let temperatureMax = dict["temperatureMax"] as? Double {
            self.temperatureMax = temperatureMax
        } else {
            print("couldn't parse temperatureMax")
        }
    }
}


