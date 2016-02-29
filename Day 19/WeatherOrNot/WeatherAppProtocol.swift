//
//  WeatherAppProtocol.swift
//  WeatherOrNot
//
//  Created by Sean Calkins on 2/26/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//


protocol WeatherAppProtocol {
    
    func passCity(c: City)
    func passGoogleAPIInfo(address: String, lat: Double, lng: Double)

}
