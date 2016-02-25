//
//  ViewController.swift
//  MoviesApp2
//
//  Created by Sean Calkins on 2/24/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
protocol MoviesAppProtocol {
    func passMovies(movies: [Movie])
}
class MovieViewController: UIViewController, MoviesAppProtocol, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var movieTableView: UITableView!
    
    var arrayOfMovies = [Movie]()
    var apiClient: MovieAPI?
    var currentMovie = Movie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiClient = MovieAPI(delegate: self)
        self.apiClient?.getMovieJSON()
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentMovie = arrayOfMovies[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as! MovieTableViewCell
        cell.movieTitleLabel.text = currentMovie.title
        cell.releaseDateLabel.text = currentMovie.release_date
        cell.loadImageFromURL("https://image.tmdb.org/t/p/w185\(currentMovie.poster_path)")
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(arrayOfMovies.count)
        return arrayOfMovies.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.currentMovie = arrayOfMovies[indexPath.row]
        performSegueWithIdentifier("showDetailViewControllerSegue", sender: self)
        print(currentMovie.title)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailViewControllerSegue" {
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.detailMovie = self.currentMovie
        }
    }
    
    
    
    func passMovies(movies: [Movie]) {
        self.arrayOfMovies = movies
        
        dispatch_async(dispatch_get_main_queue(), {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            self.movieTableView.reloadData()
        })
        debugPrint("pass movies called from view controller")
        print(arrayOfMovies.count)
        for movie in arrayOfMovies {
            print(movie.title)
        }
    }
}




