//
//  DetailViewController.swift
//  HeroesApp
//
//  Created by Sean Calkins on 2/8/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var hero: Hero?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HeroNameLabel.text = hero?.name
        self.HomePlanetLabel.text = hero?.homeworld
        self.HeroPowerLabel.text = hero?.powers
        self.imageView.image = UIImage(named: "\(hero!.imageName)")
        
  //      self.imageView.image = UIImage(named: "TIYLogo")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var HeroNameLabel: UILabel!
    @IBOutlet weak var HomePlanetLabel: UILabel!
    @IBOutlet weak var HeroPowerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
}
