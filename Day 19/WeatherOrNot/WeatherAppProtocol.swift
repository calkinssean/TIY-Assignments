//
//  WeatherAppProtocol.swift
//  WeatherOrNot
//
//  Created by Sean Calkins on 2/26/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//


protocol WeatherAppProtocol {
    func passWeatherArray(weatherArray: [Weather], c: City)
    func passGoogleAPICity(c: City)

}


import Foundation
