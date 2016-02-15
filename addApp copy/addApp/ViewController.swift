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
    var isFirstTap = true
    var hasPerformedCalculation = false
    var hasTypedNumber = false
    
    @IBAction func addButtonTapped(sender: UIButton) {
        
        print("addButtonTapped")
        
        if hasPerformedCalculation == true {
            operatorString = "+"
            value1 = 0
            updateUI()
            hasPerformedCalculation = false
        }
        if isFirstTap == true {
            operatorString = "+"
            runningTotal = value1
            value1 = 0
            isFirstTap = false
            updateUI()
        } else {
            calculate()
            operatorString = "+"
            value1 = 0
            updateUI()
            
        }
        
        
    }
    
    @IBAction func multiplicationTapped(sender: UIButton) {
        
        if hasPerformedCalculation == true {
            operatorString = "*"
            value1 = 0
            updateUI()
            hasPerformedCalculation = false
            print(value1, runningTotal)
        }
        if isFirstTap == true {
            operatorString = "*"
            runningTotal = value1
            value1 = 0
            isFirstTap = false
            updateUI()
            print(value1, runningTotal)
        }
        else if hasTypedNumber == true {
            calculate()
            operatorString = "*"
            value1 = 0
            updateUI()
            print(value1, runningTotal)
        }
        
    }
    
    
    
    
    @IBAction func minusButtonTapped(sender: UIButton) {
        
        print("minusButtonTapped")
        
        if hasPerformedCalculation == true {
            operatorString = "-"
            value1 = 0
            updateUI()
            hasPerformedCalculation = false
        }
        if isFirstTap == true {
            operatorString = "-"
            runningTotal = value1
            value1 = 0
            isFirstTap = false
            updateUI()
        } else {
            calculate()
            operatorString = "-"
            value1 = 0
            updateUI()
            
        }
        
    }
    @IBAction func equalsButtonTapped(sender: UIButton) {
        
        calculate()
        value1 = 0
        updateUI()
        hasPerformedCalculation = true
        print(value1, runningTotal)
    }
    
    
    
    @IBAction func numberButtons(sender: UIButton) {
        
        value2 = 0
        value1 = ((value1 * 10) + Double(sender.tag))
        numberLabel.text = "\(value1)"
        print(value1, runningTotal)
        hasTypedNumber = true
        
    }
    
    
    @IBAction func clearButton(sender: UIButton) {
        runningTotal = 0
        value1 = 0
        value2 = 0
        updateUI()
    }
    
    func calculate () {
        if operatorString == "+" {
            runningTotal = runningTotal + value1
        }
        if operatorString == "-" {
            runningTotal = runningTotal - value1
        }
        if operatorString == "*" {
            runningTotal = runningTotal * value1
        }
    }
    
    func updateUI() {
        
        numberLabel.text = "\(runningTotal)"
    }
    
    func convertStringToDouble(str: String?) -> Double {
        
        var returnDouble: Double = 0
        
        if str == nil || str == "" {
            return returnDouble
        }
        
        returnDouble = Double(str!)!
        
        return returnDouble
    }
    
}

