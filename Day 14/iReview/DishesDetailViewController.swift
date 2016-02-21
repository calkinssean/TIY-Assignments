//
//  DishesDetailViewController.swift
//  iReview
//
//  Created by Sean Calkins on 2/18/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class DishesDetailViewController: UIViewController {

    var detailDish : Dish?
    @IBOutlet weak var dishLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var desriptionLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    

    override func viewDidAppear(animated: Bool) {
        
        self.dishLabel.text = detailDish?.name
        self.priceLabel.text = "$\(detailDish!.price)"
        self.desriptionLabel.text = detailDish?.description
        self.dishImageView.image = UIImage(named: "\(detailDish!.image)")
        super.viewDidAppear(animated)
        print(detailDish?.rating)
        
    }

    
    
    @IBAction func starTapped(sender: UIButton) {
        
        
        if sender.tag == 1 {
            detailDish?.rating = 1
            print(detailDish?.rating)
        }
        if sender.tag == 2 {
            detailDish?.rating = 2
            print(detailDish?.rating)
        }
        if sender.tag == 3 {
            detailDish?.rating = 3
            print(detailDish?.rating)
        }
        if sender.tag == 4 {
            detailDish?.rating = 4
            print(detailDish?.rating)
        }
        if sender.tag == 5 {
            detailDish?.rating = 5
            print(detailDish?.rating)
        }
        starColor()
    }
    
    func starColor() {
        if detailDish!.rating == 1 {
            star1.selected = true
            star2.selected = false
            star3.selected = false
            star4.selected = false
            star5.selected = false
        }
        if detailDish!.rating == 2 {
            star1.selected = true
            star2.selected = true
            star3.selected = false
            star4.selected = false
            star5.selected = false
        }
        if detailDish!.rating == 3 {
            star1.selected = true
            star2.selected = true
            star3.selected = true
            star4.selected = false
            star5.selected = false
        }
        if detailDish!.rating == 4 {
            star1.selected = true
            star2.selected = true
            star3.selected = true
            star4.selected = true
            star5.selected = false
        }
        if detailDish!.rating == 5 {
            star1.selected = true
            star2.selected = true
            star3.selected = true
            star4.selected = true
            star5.selected = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

   


}
