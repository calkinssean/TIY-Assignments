//
//  StarWarsCharacter.swift
//  starWarsApp
//
//  Created by Sean Calkins on 2/15/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import Foundation

class StarWarsCharacter {
    
    //MARK: - Variables
    
    var name: String = ""
    var affiliations: String = ""
    var description: String = ""
    var imageName: String = ""
    
    //MARK: - init method/JSON Parsing
    
    init(dict: JSONDictionary) {
        
        if let name = dict["name"] as? String {
            self.name = name
            print(name)
        } else {
            print("error with name")
        }
        
        if let affiliations = dict["affiliations"] as? String {
            self.affiliations = affiliations
            print(affiliations)
        } else {
            print("error with affiliations")
        }
        
        if let description = dict["description"] as? String {
            self.description = description
        } else {
            print("error with description")
        }
        
        if let imageName = dict["imageName"] as? String {
            self.imageName = imageName
        } else {
            print("error with imageName")
        }
    }
}