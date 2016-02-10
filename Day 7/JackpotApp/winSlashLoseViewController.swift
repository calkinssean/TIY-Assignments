//
//  winSlashLoseViewController.swift
//  JackpotApp
//
//  Created by Sean Calkins on 2/9/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class winSlashLoseViewController: UIViewController {
    var imageViewText = ""
    
    
    @IBOutlet weak var winSlashLoseImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        winSlashLoseImage.image = UIImage(named: "\(imageViewText)")
        
    }


}
