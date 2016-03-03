//
//  APIController.swift
//  SpotifyAPI
//
//  Created by Sean Calkins on 2/29/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import Foundation

class SpotifyAPIController {
    
    var delegate: SpotifyAPIProtocol?
    
    init(delegate: ArtistTableViewController) {
        self.delegate = delegate
    }
    
    var currentArtist = Artist()
    var artistArray = [Artist]()
    var currentAlbum = Album()
    var currentSong = Song()
    
    
    //MARK: - Artist API Call
    
    func getArtistJSON(artistName: String) {
        
        let spotifyArtistSearched = artistName.stringByReplacingOccurrencesOfString(" ", withString: "+", options: .CaseInsensitiveSearch, range: nil)
        
        if let escapedSearchTerm = spotifyArtistSearched.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet()) {
            
            let urlString = "https://api.spotify.com/v1/search?q=\(escapedSearchTerm)&type=artist"
            if let url = NSURL(string: urlString) {
                let session = NSURLSession.sharedSession()
                let task = session.dataTaskWithURL(url, completionHandler: {
                    
                    (data, response, error) in
                    if error != nil {
                        debugPrint("there was an error \(error)")
                    } else {
                        if let data = data {
                            do {
                                if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                                    if let results = dict["artists"] as? JSONDictionary {
                                        if let items = results["items"] as? JSONArray {
                                            if let itemDict = items.first {
                                                self.currentArtist = Artist(dict: itemDict)
                                                self.getAlbumAPI(self.currentArtist.idString)
//                                                self.artistArray.insert(self.currentArtist, atIndex: 0)
//                                                DataStore.sharedInstance.artistsArray.insert(self.currentArtist, atIndex: 0)
                                                self.delegate?.passArtist(self.currentArtist)
//                                                if DataStore.sharedInstance.saveArtists() {
//                                                    print("I saved it in api controller")
//                                                } else {
//                                                    print("I couldn't save it in api controller")
//                                                }
                                                
                                                
                                            }
                                        }
                                    }
                                }
                            } catch {
                                print("couldn't parse dictionary")
                            }
                        }
                    }
                })
                task.resume()
            }
        }
    }
    
    //MARK: - Get Album API
    
    func getAlbumAPI(artistIDString: String) {
        let urlString = "https://api.spotify.com/v1/artists/\(artistIDString)/albums?market=US&album_type=album"
        if let url = NSURL(string: urlString) {
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {(data, response, error) in
                if error != nil {
                    debugPrint("there was an error \(error)")
                } else {
                    if let data = data {
                        do {
                            if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                                if let items = dict["items"] as? JSONArray {
                                    for item in items {
                                        let a = Album(dict: item)
                                        self.currentArtist.albums.append(a)
                                        self.getSongAPI(a.idString)
                                    }
                                }
                            }
                        } catch {
                            debugPrint("couldn't parse the json")
                        }
                    }
                }
            })
            task.resume()
        }
    }
    
    //MARK: - Get Song API
    
    func getSongAPI(albumIDString: String) {
        let urlString = "https://api.spotify.com/v1/albums/\(albumIDString)/tracks"
        if let url = NSURL(string: urlString) {
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url, completionHandler: {(data, response, error) in
                if error != nil {
                    debugPrint("there was an error \(error)")
                } else {
                    if let data = data {
                        do {
                            if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? JSONDictionary {
                                if let items = dict["items"] as? JSONArray {
                                    for item in items {
                                        let s = Song(dict: item)
                                        for album in self.currentArtist.albums {
                                            if album.idString == albumIDString {
                                                album.songs.append(s)
                                            }
                                        }
                                    }
                                }
                            }
                        } catch {
                            print("couldn't parse the dictionary")
                        }
                    }
                }
            })
            task.resume()
        }
    }
    
}
