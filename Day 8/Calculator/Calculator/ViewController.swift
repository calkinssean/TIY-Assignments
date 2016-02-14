//
//  ViewController.swift
//  Calculator
//
//  Created by Sean Calkins on 2/10/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var value2: Double = 0
    var value1: Double = 0
    var runningTotal: Double = 0
    var operatorString = ""
    var brain = CalculatorBrain()
    var clicks = 0
    

    @IBOutlet weak var currentNumberLabel: UILabel!
    @IBOutlet weak var runningTotalLabel: UILabel!
   
    
    
    
    @IBAction func addButton(sender: BorderButton) {
            operatorString = "+"
                print(operatorString)
        
//        if runningTotal != 0 {
//        value2 = runningTotal
//        value1 = 0
//        let answer = brain.calculate(runningTotal, value2: value2, operatorString: operatorString)
//        runningTotal = answer
//            updateUI()
//        } else {
            value2 = value1
            value1 = 0
            let answer = brain.calculate(runningTotal, value2: value2, operatorString: operatorString)
            runningTotal = answer
            updateUI()
       // }
    }
    
 
    @IBAction func minusButton(sender: BorderButton) {
        
        operatorString = "-"
        print(operatorString)
        if runningTotal != 0 {
            value2 = runningTotal
            let answer = brain.calculate(runningTotal, value2: value2, operatorString: operatorString)
            runningTotal = answer
            updateUI()
        } else {
            value2 = value1
            value1 = 0
            let answer = brain.calculate(value1, value2: value2, operatorString: operatorString)
            runningTotal = answer
            updateUI()
        }

    }
    
    @IBAction func equalsButton(sender: BorderButton) {
        let answer = brain.calculate(value1, value2: value2, operatorString: operatorString)
        print("\(answer)")
        print(runningTotal)
        updateUI()
        value1 = 0
    }
    @IBAction func clearButton(sender: BorderButton) {
        clicks++
        if clicks == 1 {
            value1 = 0
            value2 = 0
            clicks++
        } else if clicks > 1 {
            runningTotal = 0
            clicks = 0
        }
    }
    

    
        //MARK: - Number Buttons
    
    @IBAction func numberTapped(sender: BorderButton) {
        let value = Double(sender.tag)
        
        value1 = (value1 * 10) + Double(value)
        print(value1)
    }
    
    
    
    
    
    
    func updateUI() {
        runningTotalLabel.text = "\(runningTotal)"
    }


    
  
 
    

    
    
    
    


}

