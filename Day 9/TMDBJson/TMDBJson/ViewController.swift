//
//  ViewController.swift
//  TMDBJson
//
//  Created by Sean Calkins on 2/11/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    var moviesArray = [Movie]()
    var currentMovie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let (jsonString, data) = loadJSONFile("popular", fileType: "json")
        print(jsonString)
    
        if let data = data {
            do {
                let object = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                if let dict = object as? JSONDictionary {
                    print(dict)
                    if let results = dict["results"] as? JSONArray {
                        for result in results {
                            let m = Movie(dict: result)
                            self.moviesArray.append(m)
                        }
                    }

                }
                for movie in moviesArray{
                    print(movie.title)
                }
            } catch {
                print("unable to parse orig json string")
            }
        }
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        self.currentMovie = self.moviesArray[indexPath.row]
        let cell = UITableViewCell()
//        cell.textLabel.font = UIFont(name: <#T##String#>, size: <#T##CGFloat#>)
        if let title = self.currentMovie?.title {
        cell.textLabel?.text = "\(title)"
        }
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentMovie = moviesArray[indexPath.row]
        performSegueWithIdentifier("showMovieDeetsSegue", sender: self)
        print(currentMovie?.title)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMovieDeetsSegue" {
            let ViewController = segue.destinationViewController as! movieDeetsViewController
            
            ViewController.newMovie = currentMovie
            print(currentMovie?.title)
            print(currentMovie?.title)
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
