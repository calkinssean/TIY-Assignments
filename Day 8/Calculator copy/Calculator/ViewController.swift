//
//  ViewController.swift
//  Calculator
//
//  Created by Sean Calkins on 2/10/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentNumberLabel: UILabel!
    @IBOutlet weak var runningTotalLabel: UILabel!
    
    var currentNumber: Double = 0
    var currentTotal: Double = 0
    var count = 0
    var functionVar: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   
    var theBrain: CalculatorBrain = CalculatorBrain()
    
    @IBAction func buttonTapped(sender: BorderButton) {
        
        let value = sender.tag
        
        currentNumber = currentNumber + Double(value)
        print(currentNumber)
        
        
    }
    func updateUI() {
        runningTotalLabel.text = "\(currentTotal)"
        currentNumberLabel.text = "\(currentNumber)"
    }
    
    //MARK: - Number Buttons
    
  
 
    
    
    
    
    
    
    


}

