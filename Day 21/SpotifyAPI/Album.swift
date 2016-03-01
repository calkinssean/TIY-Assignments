//
//  Album.swift
//  SpotifyAPI
//
//  Created by Sean Calkins on 2/29/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import Foundation

class Album {
    
    var title: String = ""
    var imageUrls: [String] = [""]
    var idString: String = ""
    var songs = [Song]()
    
    init() {
    }
    
    init(dict: JSONDictionary) {
        
        if let title = dict["name"] as? String {
            self.title = title
            print(title)
        } else {
            print("couldn't parse title")
        }
        if let idString = dict["id"] as? String {
            self.idString = idString
        } else {
            print("couldn't parse idString")
        }
        if let items = dict["images"] as? JSONArray {
            for item in items {
                if let imageUrl = item["url"] as? String {
                    self.imageUrls.append(imageUrl)
                    print(imageUrls.count)
                } else {
                    print("error with image url")
                }
                
            }
        }
    
    }
}