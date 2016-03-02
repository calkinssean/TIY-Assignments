//
//  ViewController.swift
//  SpotifyAPI
//
//  Created by Sean Calkins on 2/29/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import UIKit
import StarWars

class ArtistTableViewController: UIViewController, SpotifyAPIProtocol, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UIViewControllerTransitioningDelegate {
    
    var apiClient: SpotifyAPIController?
    var artists = [Artist]()
    var currentArtist = Artist()
    
    
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return StarWarsGLAnimator()
    }
    
    
    
    @IBOutlet weak var artistTableView: UITableView!
    @IBOutlet weak var artistSearchTextField: UITextField!
    @IBAction func addArtistButtonTapped(sender: UIButton) {
        apiClient?.getArtistJSON(artistSearchTextField.text!)
        artistSearchTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiClient = SpotifyAPIController(delegate: self)
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == artistSearchTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let c = artists[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("artistCell") as! ArtistTableViewCell
        cell.artistNameLabel.text = c.name
        cell.loadImageFromURL(c.imageUrls.last!)
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentArtist = artists[indexPath.row]
        performSegueWithIdentifier("showAlbumTableViewSegue", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showAlbumTableViewSegue" {
            let viewController = segue.destinationViewController as! AlbumTableViewController
            viewController.currentArtist = self.currentArtist
            let destination = segue.destinationViewController
            destination.transitioningDelegate = self
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    func passArtist(artist: Artist) {
        self.artists.insert(artist, atIndex: 0)
        print(self.artists.count)
        dispatch_async(dispatch_get_main_queue(), {
            self.artistTableView.reloadData()
        })
    }
    
    
}

