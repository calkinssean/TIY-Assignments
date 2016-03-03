//
//  Song.swift
//  SpotifyAPI
//
//  Created by Sean Calkins on 2/29/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import Foundation

let kSongName = "song"

class Song: NSObject, NSCoding {
    var name: String = ""
    
    override init() {
    }
    
    init(dict: JSONDictionary) {
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            print("there was an issue with the song name")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey(kSongName) as! String
        
        super.init()
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: kSongName)
    }
}