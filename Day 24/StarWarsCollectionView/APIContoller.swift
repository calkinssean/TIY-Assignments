//
//  APIContoller.swift
//  StarWarsCollectionView
//
//  Created by Sean Calkins on 3/3/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import Foundation

class APIController {
    
    var delegate: StarWarsProtcol?
    init(delegate: CollectionViewController) {
        self.delegate = delegate
    }
    
    var characterArray = [Character]()
    var vehicleArray = [Vehicle]()
    
    func characterAPI() {
        let urlString = "http://swapi.co/api/people/"
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
                                if let results = dict["results"] as? JSONArray {
                                    for result in results {
                                        let c = Character(dict: result)
                                        self.characterArray.append(c)
                                        self.delegate?.passCharacterArray(self.characterArray)
                                    }
                                }
                            }
                        } catch {
                            print("couldn't parse the json")
                        }
                    }
                }
            })
            task.resume()
        }
    }
    
    func vehicleAPI() {
        let urlString = "http://swapi.co/api/vehicles/"
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
                                if let results = dict["results"] as? JSONArray {
                                    for result in results {
                                        let v = Vehicle(dict: result)
                                        print(v.name)
                                        print(v.created)
                                    }
                                }
                                
                            }
                        } catch {
                            print("couldn't parse the json")
                        }
                    }
                }
            })
            task.resume()
        }
    }
    
}