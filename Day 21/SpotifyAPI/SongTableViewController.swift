//
//  SongTableViewController.swift
//  SpotifyAPI
//
//  Created by Sean Calkins on 2/29/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import UIKit

class SongTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SpotifyAPIProtocol2 {
    
   
    @IBOutlet weak var songTableView: UITableView!
    var apiClient: SpotifyAPIController?
    var currentAlbum = Album()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        print(currentAlbum.idString)
        apiClient = SpotifyAPIController(delegate: self)
        apiClient?.getSongAPI(currentAlbum.idString)
        navigationItem.title = "\(currentAlbum.title)"
        
    }
    @IBAction func viewDismissTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let c = currentAlbum.songs[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("songCell") as! SongTableViewCell
        cell.songNameLabel.text = c.name
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentAlbum.songs.count
    }

  
    func passSongs(songs: [Song]) {
        self.currentAlbum.songs = songs
        print(self.currentAlbum.songs.count)
        for song in self.currentAlbum.songs {
            print(song.name)
        }
        dispatch_async(dispatch_get_main_queue(), {
        self.songTableView.reloadData()
        })
   
}
}
