//
//  DetailViewController.swift
//  StarWarsCollectionView
//
//  Created by Sean Calkins on 3/3/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
//    var currentCharacter = Character()
    
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.characterNameLabel.text = currentCharacter.name
//        self.createdLabel.text = "Created at: \(currentCharacter.created)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    

}
