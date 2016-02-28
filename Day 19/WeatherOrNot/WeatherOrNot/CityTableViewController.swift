//
//  CityTableViewController.swift
//  WeatherOrNot
//
//  Created by Sean Calkins on 2/25/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import UIKit
import CoreLocation

class CityTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, WeatherAppProtocol {
    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var citySearchTextField: UITextField!
    
    var cities = [City]()
    var currentCity = City()
    var protocolCity = City()
    var weatherArray = [Weather]()
    var apiClient: APIController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiClient = APIController(delegate: self)
        
        
    }
    @IBAction func citySearchButtonTapped(sender: UIButton) {
        apiClient?.getGoogleMapsAPI(citySearchTextField.text!)
        geocoding(citySearchTextField.text!) { (latitude: Double, longitude: Double) in
            self.apiClient?.getWeatherJSON("\(latitude),\(longitude)")
            
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentCity = cities[indexPath.row]
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showCityDetailSegue" {
            print(currentCity.formatted_address)
            print(currentCity.temperature)
            print(currentCity.icon)
            let detailViewController = segue.destinationViewController as? CityDetailViewController
            detailViewController?.detailCity = currentCity
            
        }
    }
    
    
    func geocoding(location: String, completion: (Double, Double) -> ()) {
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            if placemarks?.count > 0 {
                let placemark = placemarks?[0]
                let location = placemark!.location
                let coordinate = location?.coordinate
                completion((coordinate?.latitude)!, (coordinate?.longitude)!)
            }
        }
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func passGoogleAPICity(GC: City) {
        dispatch_async(dispatch_get_main_queue(), {
            self.protocolCity.formatted_address = GC.formatted_address
            self.cityTableView.reloadData()
            print(self.protocolCity.formatted_address)
            print(self.cities.count)
                })
    }
    
    func passWeatherArray(weatherArray: [Weather], c: City) {
        
        dispatch_async(dispatch_get_main_queue(), {
            self.weatherArray = weatherArray
            self.protocolCity = c
            self.protocolCity.weatherArray = self.weatherArray
            self.cities.append(self.protocolCity)
            self.weatherArray.removeAll()
            print(self.cities.count)
            self.cityTableView.reloadData()
        })
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        self.currentCity = cities[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("cityCell") as! CityTableViewCell
        print(currentCity.formatted_address, "this is the current address")
        cell.cityNameLabel.text = currentCity.formatted_address
        let temp = currentCity.temperature
        
        //        let n = NSNumber(double: temp!)
        //        let nstr = n.stringValue
        
        cell.cityTemperatureLabel?.text = "\(temp)"
        cell.cityWeatherLabel.text = currentCity.summary
        
        return cell
        
    }
    
    
    
}

