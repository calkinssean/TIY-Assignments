//
//  ViewController.swift
//  StarWarsCollectionView
//
//  Created by Sean Calkins on 3/3/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, StarWarsProtcol, UICollectionViewDataSource, UICollectionViewDelegate {

    var APIClient: APIController?
    
    var dateFormatter = NSDateFormatter()
    
//    var currentCharacter = Character()
    var characterArray = [Character]()
    var vehicleArray = [Vehicle]()
   
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        dateFormatter.dateFormat = "yyyy-mm-dd'T'HH:mm:ss.SSSSSSZ"
        APIClient = APIController(delegate: self)
        APIClient?.characterAPI()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailViewSegue" {
            let controller = segue.destinationViewController as! DetailViewController
//            controller.currentCharacter = self.currentCharacter
        }
    }
    
//MARK: - Collection View Methods
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let c = characterArray[indexPath.row]
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("starWarsCell", forIndexPath: indexPath) as! StarWarsCollectionViewCell
//        cell.characterNameLabel.text = c.name
//        cell.createdLabel.text = c.created
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterArray.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        self.currentCharacter = characterArray[indexPath.row]
//        print(dateFormatter.dateFromString(currentCharacter.created))
        performSegueWithIdentifier("detailViewSegue", sender: self)
        
    }
    
//MARK: - Delegate Methods
    
    func passCharacterArray(characterArray: [Character]) {
        dispatch_async(dispatch_get_main_queue(), {
            self.characterArray = characterArray
            self.collectionViewOutlet.reloadData()
        })
        print(characterArray.count)
    }
    func passVehicleArray(vehicleArray: [Vehicle]) {
        dispatch_async(dispatch_get_main_queue(), {
            self.vehicleArray = vehicleArray
            self.collectionViewOutlet.reloadData()
        })
    }
    
    
    }

