//
//  Restaurant.swift
//  iReview
//
//  Created by Sean Calkins on 2/18/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import Foundation

class Restaurant {
    var name: String = ""
    var description: String = ""
    var location: String = ""
    var menusArray = [Menu]()
    var imageName = ""
    var latitude: Double = 0.0
    var longitude: Double = 00

    init(dict: JSONDictionary) {
        
        if let name = dict["name"] as? String {
            self.name = name
            print(name)
        } else {
            print("error with name")
        }
        
        if let description = dict["description"] as? String {
            self.description = description
            print(description)
        } else {
            print("error with description")
        }
        
        if let location = dict["location"] as? String {
            self.location = location
            print(location)
        } else {
            print("error with location")
        }
        
        if let latitude = dict["latitude"] as? Double {
            self.latitude = latitude
            print(latitude)
        } else {
            print("error with latitude")
        }
        
        if let longitude = dict["longitude"] as? Double {
            self.longitude = longitude
            print(longitude)
        } else {
            print("error with longitude")
        }
        
        if let results = dict["menus"] as? JSONArray {
            for result in results {
                let m = Menu(dict: result)
                self.menusArray.append(m)
                print("menus appended")
            }
            
        } else {
            print("error with menus")
        }
        
        if let imageName = dict["image"] as? String {
            self.imageName = imageName
        } else {
            print("error with imageName")
        }
    }
}
    
