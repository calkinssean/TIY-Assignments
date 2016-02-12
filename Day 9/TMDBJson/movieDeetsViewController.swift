//
//  movieDeetsViewController.swift
//  TMDBJson
//
//  Created by Sean Calkins on 2/11/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit




class movieDeetsViewController: UIViewController {
    var newMovie: Movie?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieDetailsLabel: UILabel!
    
    


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let title = newMovie?.title {
           titleLabel.text = "\(title)"
        }
        if let movieDeets = newMovie?.overview {
            movieDetailsLabel.text = "\(movieDeets)"
        }
        
    }


    


}
