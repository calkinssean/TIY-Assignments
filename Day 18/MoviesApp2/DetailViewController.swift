//
//  DetailViewController.swift
//  MoviesApp2
//
//  Created by Sean Calkins on 2/24/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    
    
    var detailMovie = Movie()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieTitleLabel.text = detailMovie.title
        self.movieOverviewLabel.text = detailMovie.overview
        self.loadImageFromURL("https://image.tmdb.org/t/p/w185\(detailMovie.poster_path)")
    }
    func loadImageFromURL(urlString: String) {
        
        if urlString.isEmpty == false {
            
            dispatch_async(dispatch_get_main_queue(), {
                if let url = NSURL(string: urlString) {
                    if let data = NSData(contentsOfURL: url) {
                        self.movieImageView.image = UIImage(data: data)
                    }
                }
            })
        } else {
            debugPrint("Invalid \(urlString)")
        }
    }
    
    
}
