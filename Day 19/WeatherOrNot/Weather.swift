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
    var precipIntensity: Double = 0.0025
    var precipProbability: Double = 0.07
    var precipType: String = "none"
    var temperatureMin: Double = 57.3
    var temperatureMax: Double = 66.18
    var dewPoint: Double = 55.24
    var humidity: Double = 0.93
    var windSpeed: Double = 6
    var windBearing: Double = 251
    var visibility: Double = 10
    var cloudCover: Double = 0.76
    var pressure: Double = 1022.08
    var ozone: Double = 0.0

    
    
    
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
        if let precipIntensity = dict["precipIntensity"] as? Double {
            self.precipIntensity = precipIntensity
        } else {
            print("couldn't parse precipIntensity")
        }
        if let precipProbability = dict["precipProbability"] as? Double {
            self.precipProbability = precipProbability
        } else {
            print("couldn't parse precipProbability")
        }
        if let precipType = dict["precipType"] as? String {
            self.precipType = precipType
        } else {
            print("couldn't parse precipType")
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
        if let dewPoint = dict["dewPoint"] as? Double {
            self.dewPoint = dewPoint
        } else {
            print("couldn't parse dewPoint")
        }
        if let humidity = dict["humidity"] as? Double {
            self.humidity = humidity
        } else {
            print("couldn't parse humidity")
        }
        if let windSpeed = dict["windSpeed"] as? Double {
            self.windSpeed = windSpeed
        } else {
            print("couldn't parse windSpeed")
        }
        if let windBearing = dict["windBearing"] as? Double {
            self.windBearing = windBearing
        } else {
            print("couldn't parse windBearing")
        }
        if let visibility = dict["visibility"] as? Double {
            self.visibility = visibility
        } else {
            print("couldn't parse visibility")
        }
        if let cloudCover = dict["cloudCover"] as? Double {
            self.cloudCover = cloudCover
        } else {
            print("couldn't parse cloudCover")
        }
        if let pressure = dict["pressure"] as? Double {
            self.pressure = pressure
        } else {
            print("couldn't parse pressure")
        }
        if let ozone = dict["ozone"] as? Double {
            self.ozone = ozone
        } else {
            print("couldn't parse ozone")
        }
    }
}


