//
//  Dishes.swift
//  iReview
//
//  Created by Sean Calkins on 2/18/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import Foundation

class Dish
{
    var name: String = ""
    var description: String = ""
    var image: String = ""
    var rating: Int = 0
    var price: Double = 0.0
    
    
    
    
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
        if let image = dict["image"] as? String {
            self.image = image
            print(image)
        } else {
            print("error with image")
        }
        if let rating = dict["rating"] as? Int {
            self.rating = rating
            print(rating)
        } else {
            print("error with rating")
        }
        if let price = dict["price"] as? Double {
            self.price = price
            print(price)
        } else {
            print("error with price")
        }
    }

}