//
//  ViewController.swift
//  HeroesApp
//
//  Created by Sean Calkins on 2/8/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    typealias JSONDictionary = [String:AnyObject]
    typealias JSONArray = [AnyObject]
    var jsonString = ""
    
    
    @IBOutlet weak var tableView: UITableView!
    var shieldHeroes = [Hero]()
    var currentHero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJsonHeroes()
        print(shieldHeroes)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shieldHeroes.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        self.currentHero = self.shieldHeroes[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(self.currentHero!.name)"
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentHero = self.shieldHeroes[indexPath.row]
        performSegueWithIdentifier("segueToDetailView", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToDetailView" {
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.hero = self.currentHero
        }
    }
    func getJsonHeroes() {
        
        if let filePath = NSBundle.mainBundle().pathForResource("heros", ofType: "json") {
            do {
                jsonString = try NSString(contentsOfFile: filePath, usedEncoding: nil) as String
            } catch {
                print("Could not load data")
            }
        } else {
            print("heros not found")
        }
        let str = String(jsonString)
        
        let data = str.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        do {
            if let data = data,
                namesArray = try
                    NSJSONSerialization.JSONObjectWithData(data, options: []) as?
                JSONArray {
                    for result in namesArray {
                        
                        if let jsonResult = result as? JSONDictionary {
                            
                            print(jsonResult)
                            
                            var hero = Hero(name: "", homeworld: "", powers: "", imageName: "")
                            
                            if let name = jsonResult["name"] as? String {
                                hero.name = name
                                print(name)
                            }
                            
                            if let homeworld = jsonResult["homeworld"] as? String {
                                hero.homeworld = homeworld
                                print(homeworld)
                            }
                            
                            if let powers = jsonResult["powers"] as? String {
                                hero.powers = powers
                            }
                            
                            if let imageName = jsonResult["imageName"] as? String {
                                hero.imageName = imageName
                            }
                            
                            shieldHeroes.append(hero)
                        }
                    }
            }
        } catch {
            print("An error occurred")
        }
        
        
    }
}