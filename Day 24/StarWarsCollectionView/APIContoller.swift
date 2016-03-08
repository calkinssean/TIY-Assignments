//
//  APIContoller.swift
//  StarWarsCollectionView
//
//  Created by Sean Calkins on 3/3/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import Foundation
import CoreData

class APIController {
    
    var delegate: StarWarsProtcol?
    let dataController = DataController()
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
                                        self.seedPerson(result)
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
                                        //                                        let v = Vehicle(dict: result)
                                        //                                        print(v.name)
                                        //                                        print(v.created)
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
    func seedPerson(dict: JSONDictionary) {
        
        let mom = dataController.managedObjectContext
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: mom) as! Person
        let today = NSDate()
        if let name = dict["name"] as? String {
            entity.setValue(name, forKey: "name")
            print(entity.name)
        } else {
            print("couldn't parse the name json")
        }
        if let gender = dict["gender"] as? String {
            entity.setValue(gender, forKey: "gender")
        } else {
            print("couldn't parse gender json")
        }
        if let created = dict["created"] as? NSDate {
            entity.setValue(created, forKey: "created")
        } else {
            print("error with created")
        }
//        let entityVehicle = NSEntityDescription.insertNewObjectForEntityForName("vehicle", inManagedObjectContext: mom) as! Vehicle
//        
//        entityVehicle.setValue("X-wing", forKey: "name")
//        entityVehicle.setValue(today, forKey: "created")
//        
//        let vehicles = NSSet(object: entityVehicle)
//        entity.setValue(vehicles, forKey: "vehicles")
//        
        do {
            try mom.save()
            
        } catch {
            fatalError("An error occured saving Person and Vehicle \(error)")
        }
        
    }
    func fetchPerson() {
        let mom = dataController.managedObjectContext
        let fetchPerson = NSFetchRequest(entityName: "Person")
        do {
            let persons = try mom.executeFetchRequest(fetchPerson) as! [Person]
            for p in persons {
                print(p.name)
                print(p.created)
                
                //                if let vehicles = p.vehicles {
                //                    let vehicle = Array(vehicles) as! [Vehicle]
                //                    for v in vehicles {
                //                        print(v.name)
                //                    }
                //                }
                
            }
        } catch {
            fatalError("I couldn't fetch the person \(error)")
        }
    }
    
    
}