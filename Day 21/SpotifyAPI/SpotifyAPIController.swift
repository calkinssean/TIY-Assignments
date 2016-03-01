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
    var songDelegate: SpotifyAPIProtocol2?
    init(delegate: SongTableViewController) {
        self.songDelegate = delegate
    }
  
    init(delegate: ArtistTableViewController) {
        self.delegate = delegate
    }
    
    var currentArtist = Artist()
    
    //MARK: - Artist API Call
    
    func getArtistJSON(artistName: String) {
        let urlString = "https://api.spotify.com/v1/search?q=\(artistName)&type=artist"
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
                                        let itemDict = items.first!
                                        self.currentArtist = Artist(dict: itemDict)
                                        self.getAlbumAPI(self.currentArtist.idString)
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
                                    var albums = [Album]()
                                    for item in items {
                                        let a = Album(dict: item)
                                        print(a.idString)
                                        albums.append(a)
                                    }
                                    self.currentArtist.albums = albums
                                    self.delegate?.passArtist(self.currentArtist)
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
                                    var songs = [Song]()
                                    for item in items {
                                        let s = Song(dict: item)
                                        songs.append(s)
                                        
                                    }
                                    self.songDelegate!.passSongs(songs)
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
