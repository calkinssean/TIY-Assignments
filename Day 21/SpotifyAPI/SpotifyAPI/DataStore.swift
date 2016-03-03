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
    private override init () {}
    
    var artistArray = [Artist]()
    
    let artistArchiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("artist.archive")
    }()

    func saveChanges() -> Bool {
        //print("saving artist to: \(artistArchiveURL.path!)")
        debugDump()
        return NSKeyedArchiver.archiveRootObject(artistArray, toFile: artistArchiveURL.path!)
    }
    
    func loadArtists() -> Bool {
        if let archivedArtists = NSKeyedUnarchiver.unarchiveObjectWithFile(artistArchiveURL.path!) as? [Artist] {
            self.artistArray = archivedArtists
            print("artist count \(self.artistArray.count)")
            debugDump()
            return true
        } else {
            print("couldn't unarchive artists")
        }
        return false
    }
    
    func countOfArtists() -> Int {
        return self.artistArray.count
    }
    func debugDump() {
        
        for a in artistArray {
            print(a.name)
        }
    }



}
