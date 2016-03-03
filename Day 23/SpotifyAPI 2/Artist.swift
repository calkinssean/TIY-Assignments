//
//  Artist.swift
//  SpotifyAPI
//
//  Created by Sean Calkins on 2/29/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import Foundation

// NSCoding Constants
let kArtistIdString = "idString"
let kArtistName = "name"
let kArtistImageUrls = "imageUrls"
let kArtistAlbums = "alubms"

class Artist: NSObject, NSCoding {
    
    var idString: String = ""
    var name: String = ""
    var imageUrls: [String] = [""]
    var albums = [Album]()
    
    override init() {
    }
    
    init(dict: JSONDictionary) {
        
        if let idString  = dict["id"] as? String {
            self.idString  = idString
        } else {
            print("couldn't parse artist id")
        }
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            print("couldn't parse artist name")
        }
        if let items = dict["images"] as? JSONArray {
            for item in items {
                if let imageUrl = item["url"] as? String {
                    self.imageUrls.append(imageUrl)
                } else {
                    print("error with artist image url")
                }
            }
            print(imageUrls.count)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        self.idString = aDecoder.decodeObjectForKey(kArtistIdString) as! String
        self.name = aDecoder.decodeObjectForKey(kArtistName) as! String
        self.imageUrls = aDecoder.decodeObjectForKey(kArtistImageUrls) as! [String]
        self.albums = aDecoder.decodeObjectForKey(kArtistAlbums) as! [Album]
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(idString, forKey: kArtistIdString)
        aCoder.encodeObject(name, forKey: kArtistName)
        aCoder.encodeObject(imageUrls, forKey: kArtistImageUrls)
        aCoder.encodeObject(albums, forKey: kArtistAlbums)
    }
}