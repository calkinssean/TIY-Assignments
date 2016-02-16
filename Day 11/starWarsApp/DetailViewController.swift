//
//  DetailViewController.swift
//  starWarsApp
//
//  Created by Sean Calkins on 2/15/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var newCharacter: StarWarsCharacter?
    
    //MARK: - Variables
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
   
    //MARK: - View Will Appear
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print(newCharacter?.description)
        super.viewDidLoad()
        self.nameLabel.text = newCharacter?.name
        self.descriptionLabel.text = newCharacter?.description
        self.profileImageView.image = UIImage(named: "\(newCharacter!.imageName)")
        updateColors()
        }
   
    
    //MARK: - UI update
    
    func updateColors() {
        if newCharacter?.affiliations == "Sith" {
            self.view.backgroundColor = UIColor.blackColor()
            nameLabel.font = UIFont(name: "Pure evil 2", size: 45.0)
            nameLabel.textColor = UIColor.redColor()
            descriptionLabel.font = UIFont(name: "Pure evil 2", size: 20.0)
            descriptionLabel.textColor = UIColor.redColor()
        } else if newCharacter?.affiliations == "Jedi Order" {
            self.view.backgroundColor = UIColor.whiteColor()
            nameLabel.font = UIFont(name: "trench", size: 45.0)
            nameLabel.textColor = UIColor.blackColor()
            descriptionLabel.font = UIFont(name: "trench", size: 20.0)
            descriptionLabel.textColor = UIColor.blackColor()
        } else {
            self.view.backgroundColor = UIColor.whiteColor()
            nameLabel.font = UIFont(name: "Papyrus", size: 40.0)
            nameLabel.textColor = UIColor.blueColor()
            descriptionLabel.font = UIFont(name: "Papyrus", size: 15.0)
            descriptionLabel.textColor = UIColor.blueColor()
        }
    }
    
    

}







