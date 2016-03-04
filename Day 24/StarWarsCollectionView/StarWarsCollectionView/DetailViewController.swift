//
//  DetailViewController.swift
//  StarWarsCollectionView
//
//  Created by Sean Calkins on 3/3/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var currentCharacter = Character()
    
    @IBOutlet weak var characterNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.characterNameLabel.text = currentCharacter.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}