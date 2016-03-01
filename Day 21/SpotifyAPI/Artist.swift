//
//  Artist.swift
//  SpotifyAPI
//
//  Created by Sean Calkins on 2/29/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import Foundation

class Artist {
    
    var idString: String = ""
    var name: String = ""
    var imageUrls: [String] = [""]
    var albums = [Album]()
    
    init() {
    }
    
    init(dict: JSONDictionary) {
        
        if let idString  = dict["id"] as? String {
            self.idString  = idString
        } else {
            print("couldn't parse id")
        }
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            print("couldn't parse name")
        }
        if let items = dict["images"] as? JSONArray {
            for item in items {
                if let imageUrl = item["url"] as? String {
                    self.imageUrls.append(imageUrl)
                } else {
                    print("error with image url")
                }
            }
            print(imageUrls.count)
        }
        
        
    }
}