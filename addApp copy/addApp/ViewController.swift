//
//  ViewController.swift
//  addApp
//
//  Created by Sean Calkins on 2/12/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    var value2: Double = 0
    var value1: Double = 0
    var runningTotal: Double = 0
    var operatorString = ""
    var hasTypedNumber = false
    var hasPerformedCalculation = false
    var isFirstTap = true
    var brain = CalculatorBrain()
    
    
    @IBAction func addButtonTapped(sender: UIButton) {
        operatorString = "+"
        print("addButtonTapped")
        if hasTypedNumber == true {
            value2 = value1
            runningTotal = runningTotal + value2
            value1 = 0
            hasTypedNumber = false
            print(runningTotal)
            updateUI()
            hasPerformedCalculation = false
        } else {
            
        }
        
        
    }
    @IBAction func minusButtonTapped(sender: UIButton) {
        operatorString = "-"
        print("minusButtonTapped")
    
        if isFirstTap == true {
            value2 = value1
            runningTotal = runningTotal + value2
            value1 = 0
            value2 = 0
            isFirstTap = false
            print(runningTotal)
        } else if isFirstTap == false {
            runningTotal = runningTotal - value1
            value1 = 0
            print(runningTotal)
            updateUI()
            hasPerformedCalculation = false
            
        }
        
    
    }
    @IBAction func equalsButtonTapped(sender: UIButton) {
        if hasPerformedCalculation == false && hasTypedNumber == true {
            
            if operatorString == "+" {
                runningTotal = runningTotal + value1
                hasPerformedCalculation = true
                updateUI()
                value1 = 0
                print(runningTotal)
            }
            if operatorString == "-" {
                runningTotal = runningTotal - value1
                value1 = 0
                print(runningTotal)
                updateUI()
                isFirstTap = true
                hasPerformedCalculation = true
            }
        } else if hasTypedNumber == true && hasPerformedCalculation == false {
            runningTotal = value1
            updateUI()
        }
    }
    
    
    
    @IBAction func numberButtons(sender: UIButton) {
        
        value2 = 0
        
        value1 = ((value1 * 10) + Double(sender.tag))
        
        numberLabel.text = "\(value1)"
        hasTypedNumber = true
        
    }
    
    
    @IBAction func clearButton(sender: UIButton) {
        runningTotal = 0
        value1 = 0
        value2 = 0
        updateUI()
    }
    
    
    func convertStringToDouble(str: String?) -> Double {
        
        var returnDouble: Double = 0
        
        if str == nil || str == "" {
            return returnDouble
        }
        
        returnDouble = Double(str!)!
        
        return returnDouble
    }
    
    func updateUI() {
        numberLabel.text = "\(runningTotal)"
    }
    
}

