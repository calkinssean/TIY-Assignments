//
//  Vehicles.swift
//  StarWarsCollectionView
//
//  Created by Sean Calkins on 3/3/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import Foundation

class Vehicle {
    var name: String = ""
    var created: String = ""
    
    init(){}
    init(dict: JSONDictionary) {
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            print("couldn't parse name")
        }
        if let created = dict["created"] as? String {
            self.created = created
        } else {
            print("couldn't parse created")
        }
    }
    
}