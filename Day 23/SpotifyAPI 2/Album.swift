//
//  Album.swift
//  SpotifyAPI
//
//  Created by Sean Calkins on 2/29/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import Foundation

class Album: NSObject, NSCoding {
    
    //NSCoding Constants
    let kAlbumTitle = "title"
    let kAlbumImageUrls = "imageUrls"
    let kAlbumIdString = "idString"
    let kAlbumSongs = "songs"
    
    var title: String = ""
    var imageUrls: [String] = [""]
    var idString: String = ""
    var songs = [Song]()
    
    override init() {
    }
    
    init(dict: JSONDictionary) {
        
        if
            let title = dict["name"] as? String {
                self.title = title
                print(title)
        } else {
            print("couldn't parse album title")
        }
        if let idString = dict["id"] as? String {
            self.idString = idString
        } else {
            print("couldn't parse album idString")
        }
        if let items = dict["images"] as? JSONArray {
            for item in items {
                if let imageUrl = item["url"] as? String {
                    self.imageUrls.append(imageUrl)
                    print(imageUrls.count)
                } else {
                    print("error with album image url")
                }
                
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObjectForKey(kAlbumTitle) as! String
        self.imageUrls = aDecoder.decodeObjectForKey(kAlbumImageUrls) as! [String]
        self.idString = aDecoder.decodeObjectForKey(kAlbumIdString) as! String
        self.songs = aDecoder.decodeObjectForKey(kAlbumSongs) as! [Song]
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: kAlbumTitle)
        aCoder.encodeObject(imageUrls, forKey: kAlbumImageUrls)
        aCoder.encodeObject(idString, forKey: kAlbumIdString)
        aCoder.encodeObject(songs, forKey: kAlbumSongs)
    }
}