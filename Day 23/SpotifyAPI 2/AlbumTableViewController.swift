//
//  AlbumTableViewController.swift
//  SpotifyAPI
//
//  Created by Sean Calkins on 2/29/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import UIKit
import StarWars

class AlbumTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var albumTableView: UITableView!
    
    var currentArtist = Artist()
    var currentAlbum = Album()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        navigationItem.title = "\(currentArtist.name)"
        print(currentArtist.albums.count)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return StarWarsGLAnimator()
    }
    
    @IBAction func viewDismissTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let c = currentArtist.albums[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("albumCell") as! AlbumTableViewCell
        cell.albumNameLabel.text = c.title
        cell.loadImageFromURL(c.imageUrls.last!)
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentArtist.albums.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentAlbum = currentArtist.albums[indexPath.row]
        performSegueWithIdentifier("showSongTableViewSegue", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSongTableViewSegue" {
            let viewController = segue.destinationViewController as! SongTableViewController
            viewController.currentAlbum = self.currentAlbum
            let destination = segue.destinationViewController
            destination.transitioningDelegate = self
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
 
}

