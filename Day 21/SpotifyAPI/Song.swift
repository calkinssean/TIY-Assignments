//
//  Song.swift
//  SpotifyAPI
//
//  Created by Sean Calkins on 2/29/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import Foundation

class Song {
    var name: String = ""
    
    init() {
    }
    
    init(dict: JSONDictionary) {
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            print("there was an issue with the name")
        }
    }
}