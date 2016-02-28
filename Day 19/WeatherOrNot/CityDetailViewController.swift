//
//  CityDetailViewController.swift
//  WeatherOrNot
//
//  Created by Sean Calkins on 2/25/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var citySummaryLabel: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    
    var detailCity: City?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let i = (self.detailCity?.icon) {
            iconImage.image = UIImage(named: "\(i)")
            print(self.detailCity?.icon)
        }
        self.cityNameLabel.text = detailCity?.formatted_address
        self.citySummaryLabel.text = detailCity?.summary
        print("this is the icon named \(detailCity?.icon)")
        print(detailCity?.summary)
        }

}
