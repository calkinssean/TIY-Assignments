//
//  Hero.swift
//  HeroesApp
//
//  Created by Sean Calkins on 2/8/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class Hero {
    var name: String
    var homeworld: String
    var powers: String
    var imageName : String
    
    init(name: String, homeworld: String, powers: String, imageName: String) {
        self.name = name
        self.homeworld = homeworld
        self.powers = powers
        self.imageName = imageName
    }
}