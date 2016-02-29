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
    var apiClient: APIController?
    var lat: Double = 0.0
    var lng: Double = 0.0
    var address: String = ""
    var numberFormatter = NSNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberFormatter.maximumFractionDigits = 0
        apiClient = APIController(delegate: self)
        
    //MARK: - Button Functions
    }
    @IBAction func citySearchButtonTapped(sender: UIButton) {
        self.apiClient?.getGoogleMapsAPI(citySearchTextField.text!)
    }
    
    //MARK: - TableView Functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentCity = cities[indexPath.row]
        performSegueWithIdentifier("showCityDetailSegue", sender: self)
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let c = cities[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("cityCell") as! CityTableViewCell
        print(c.formatted_address, "this is the current address")
        cell.cityNameLabel.text = c.formatted_address
        let temp = c.temperature
        cell.cityTemperatureLabel?.text = "\(numberFormatter.stringForObjectValue(temp)!)°F"
        cell.cityWeatherLabel.text = c.summary
        return cell
    }
    
    //MARK: - Prepare for segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showCityDetailSegue" {
            print(currentCity.formatted_address)
            print(currentCity.temperature)
            print(currentCity.icon)
            let detailViewController = segue.destinationViewController as? CityDetailViewController
            detailViewController?.detailCity = self.currentCity
            
        }
    }
  
    
    //MARK: - Delgegate Functions
    
    func passGoogleAPIInfo(address: String, lat: Double, lng: Double) {
       
            self.address = address
            self.lat = lat
            self.lng = lng
            self.apiClient?.getWeatherJSON("\(self.lat),\(self.lng)")
      
    }
    func passCity(c: City) {
        
        dispatch_async(dispatch_get_main_queue(), {
            self.protocolCity = c
            self.protocolCity.formatted_address = self.address
            self.protocolCity.latitude = self.lat
            self.protocolCity.longitude = self.lng
            self.cities.insert(self.protocolCity, atIndex: 0)
            print(self.cities.count)
            self.cityTableView.reloadData()
      
        })
        
    }
    
}

