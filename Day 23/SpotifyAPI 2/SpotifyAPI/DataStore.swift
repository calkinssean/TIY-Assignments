//
//  DataStore.swift
//  SpotifyAPI
//
//  Created by Sean Calkins on 3/2/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import Foundation

class DataStore: NSObject {
    
    static let sharedInstance = DataStore()
    override private init() {}
    
    var artistsArray = [Artist]()
    
    func saveArtists() -> Bool {
        let filePath = self.documentsDirectory().URLByAppendingPathComponent("artists.archive")
        return NSKeyedArchiver.archiveRootObject(artistsArray, toFile: filePath.path!)
    }
    
    func loadArtists() -> Bool {
        let filePath = self.documentsDirectory().URLByAppendingPathComponent("artists.archive")
        if let archivedArtists = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath.path!) as? [Artist] {
            self.artistsArray = archivedArtists
            print("artists have been loaded")
            return true
        } else {
            print("I had a problem loading the artists")
        }
        return false
    }
    
    func documentsDirectory() -> NSURL {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory
    }
    
    func debugDump() {
        for a in artistsArray {
            print(a.name)
            print(a.albums.count)
        }
    }
}