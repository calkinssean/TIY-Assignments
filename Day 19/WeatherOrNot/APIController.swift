//
//  APIController.swift
//  WeatherOrNot
//
//  Created by Sean Calkins on 2/26/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import Foundation

class APIController {
    
    var weatherArray = [Weather]()
    var currentWeather: Weather?
    var currentCity: City?
    var googleAPICity = City()
    var delegate: WeatherAppProtocol?
    init(delegate: CityTableViewController) {
        self.delegate = delegate
    }
// MARK: - Google Maps API Call
    func getGoogleMapsAPI(zipcode: String) {
        let urlString = "http://maps.googleapis.com/maps/api/geocode/json?&components=postal_code:\(zipcode)&sensor=false"
        if let url = NSURL(string: urlString) {
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {
                (data, response, error) in
                if error != nil {
                    debugPrint("there was an error \(error)")
                } else {
                    if let data = data {
                        do {
                            if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                                if let results = dict["results"] as? JSONArray {
                                    for result in results {
                                        print(result)
                                        if let address = result["formatted_address"] as? String {
                                            print(address)
                                            self.googleAPICity.formatted_address = address
                                            print(self.googleAPICity.formatted_address)
                                            self.delegate?.passGoogleAPICity(self.googleAPICity)
                                        }
                                    }
                                }
                            }
                        } catch {
                            debugPrint("couldn't parse the json")
                        }
                    }
                }
                
            })
            task.resume()
        }
    }
    // MARK: - Forecast.IO API call

    
    func getWeatherJSON(location: String) {
        let urlString = "https://api.forecast.io/forecast/e3c2770e962780345933e7efd9028f02/\(location)"
        if let url = NSURL(string: urlString) {
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {
                (data, response, error) in
                if error != nil {
                    debugPrint("there was an error")
                } else {
                    if let data = data {
                        do {
                            if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                                if let dictCurrently = dict["currently"] as? JSONDictionary {
                                    self.currentCity = City(dict: dictCurrently)
                                    print(self.currentCity!.temperature)
                                    
                                }
                                if let dictDaily = dict["daily"] as? JSONDictionary {
                                    if let data = dictDaily["data"] as? JSONArray {
                                        for result in data {
                                            let w = Weather(dict: result)
                                            self.weatherArray.append(w)
                                            //                                            print(self.weatherArray.count)
                                        }
                                        self.delegate?.passWeatherArray(self.weatherArray, c: (self.currentCity)!)
                                    }
                                    
                                    
                                }
                            } else {
                                debugPrint("couldn't parse dictionary")
                            }
                        } catch {
                            debugPrint("couldn't parse json")
                        }
                    }
                }
            })
            task.resume()
        } else {
            debugPrint("invalid url")
        }
      
    }
}