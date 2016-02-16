//
//  ViewController.swift
//  starWarsApp
//
//  Created by Sean Calkins on 2/15/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var charactersArray = [StarWarsCharacter]()
    var currentCharacter: StarWarsCharacter?
    var jsonString = ""

//MARK: - TableView functions
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let character = self.charactersArray[indexPath.row]
        if character.affiliations == "Sith" {
            let cell = tableView.dequeueReusableCellWithIdentifier("TypeThreeCell", forIndexPath: indexPath) as! TypeThreeTableViewCell
            cell.nameLabel.text = character.name
            cell.affiliationLabel.text = character.affiliations
            cell.profileImageView.image = UIImage(named: character.imageName)
            return cell
        } else if character.affiliations == "Jedi Order" {
            let cell = tableView.dequeueReusableCellWithIdentifier("TypeOneCell", forIndexPath: indexPath) as! TypeOneTableViewCell
            cell.nameLabel.text = character.name
            cell.affiliationLabel.text = character.affiliations
            cell.profileImageView.image = UIImage(named: character.imageName)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("TypeTwoCell", forIndexPath: indexPath) as! TypeTwoTableViewCell
            cell.nameLabel.text = character.name
            cell.affiliationLabel.text = character.affiliations
            cell.profileImageView.image = UIImage(named: character.imageName)
            return cell
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row % 2 == true {
            return 250.0
        } else {
            return 250.0
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        [indexPath.row]
        self.currentCharacter = self.charactersArray[indexPath.row]
        performSegueWithIdentifier("detailViewControllerSegue", sender: self)
        print(currentCharacter?.name)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersArray.count
    }
    
  //MARK: - Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailViewControllerSegue" {
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.newCharacter = currentCharacter
            print(currentCharacter?.name)
        }
    }
    
//MARK: - JSON file loading and viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let (jsonString, data) = loadJSONFile("starWars", fileType: "json")
        print(jsonString)
        
        if let data = data {
            
            do {
                
                let object = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                if let dict = object as? JSONDictionary {
                    
                    if let results = dict["characters"] as? JSONArray {
                        for result in results {
                            let m = StarWarsCharacter(dict: result)
                            self.charactersArray.append(m)
                            print("characters appended")
                        }
                    }
                    
                }
                for currentCharacter in charactersArray {
                    print(currentCharacter.name)
                }
            } catch {
                print("unable to parse orig json string")
            }
        }
        
    }
    
    func loadJSONFile(filename: String, fileType: String) -> (String, NSData?) {
        
        var returnString = ""
        var data: NSData? = nil
        
        guard let filePath = NSBundle.mainBundle().URLForResource(filename, withExtension: fileType) else { return (returnString, data) }
        
        if let jsondata = NSData(contentsOfURL: filePath) {
            if let jsonString = NSString(data: jsondata, encoding: NSUTF8StringEncoding) {
                returnString = jsonString as String
                data = jsondata
            }
        }
        return(returnString, data)
    }
}

