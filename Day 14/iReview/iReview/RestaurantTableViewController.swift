//
//  ViewController.swift
//  iReview
//
//  Created by Sean Calkins on 2/18/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var restaurantArray = [Restaurant]()
    var currentRestaurant: Restaurant?
    var jsonString = ""
    
    
    
    //  "showRestaurantProfileSegue"
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let restaurant = self.restaurantArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("restaurantCell", forIndexPath: indexPath) as! RestaurantTableViewCell
        cell.restaurantNameLabel.text = restaurant.name
        cell.restaurantAdressLabel.text = restaurant.location
        cell.restaurantImage.image = UIImage(named: (restaurant.imageName))
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentRestaurant = restaurantArray[indexPath.row]
        performSegueWithIdentifier("showRestaurantProfileSegue", sender: self)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantArray.count
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantProfileSegue" {
            let detailViewController = segue.destinationViewController as! RestaurantProfileViewController
            detailViewController.detailRestaurant = currentRestaurant
            print(currentRestaurant?.name)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let (jsonString, data) = loadJSONFile("iReview", fileType: "json")
        print(jsonString)
        
        if let data = data {
            
            do {
                
                let object = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                if let dict = object as? JSONDictionary {
                    
                    if let results = dict["restaurants"] as? JSONArray {
                        for result in results {
                            let m = Restaurant(dict: result)
                            self.restaurantArray.append(m)
                            print("restaurant appended")
                        }
                    }
                    
                }
                for currentRestaurant in restaurantArray {
                    print(currentRestaurant.name)
                }
            } catch {
                print("unable to parse orig json string")
            }
        }
        
    }
    
    func loadJSONFile(filename: String, fileType: String) -> (String, NSData?) {
        
        var returnString = ""
        var data: NSData? = nil
        
        guard let filePath = NSBundle.mainBundle().URLForResource(filename, withExtension: fileType) else { return (returnString, data) }
        
        if let jsondata = NSData(contentsOfURL: filePath) {
            if let jsonString = NSString(data: jsondata, encoding: NSUTF8StringEncoding) {
                returnString = jsonString as String
                data = jsondata
            }
        }
        return(returnString, data)
    }
    
    
    
}


