//
//  ViewController.swift
//  Calculator
//
//  Created by Sean Calkins on 2/10/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit


    class ViewController: UIViewController {
        
        

        @IBOutlet weak var runningTotalLabel: UILabel!
        
        var value2: Double = 0
        var value1: Double = 0
        var runningTotal: Double = 0
        var operatorString = ""
        var isFirstTap = true
        var hasPerformedCalculation = false
        var hasTypedNumber = false
        
        @IBAction func addButtonTapped(sender: BorderButton) {
            
            print("addButtonTapped")
            
            if hasPerformedCalculation == true {
                operatorString = "+"
                value1 = 0
                updateUI()
                hasPerformedCalculation = false
                hasTypedNumber = false
                return
            }
            if isFirstTap == true {
                operatorString = "+"
                runningTotal = value1
                value1 = 0
                isFirstTap = false
                updateUI()
                hasTypedNumber = false
                return
            } else {
                calculate()
                operatorString = "+"
                value1 = 0
                updateUI()
                hasTypedNumber = false
                return
            }
            
            
        }
        
        
        @IBAction func piButton(sender: BorderButton) {
            value1 = 3.1415926536
            print(value1, runningTotal)
        }
        @IBAction func multiplicationTapped(sender: BorderButton) {
            
            if hasPerformedCalculation == true {
                operatorString = "*"
                value1 = 0
                updateUI()
                hasPerformedCalculation = false
                print(value1, runningTotal)
                hasTypedNumber = false
                return
            }
            if isFirstTap == true {
                operatorString = "*"
                runningTotal = value1
                value1 = 0
                isFirstTap = false
                updateUI()
                print(value1, runningTotal)
                hasTypedNumber = false
                return
            }
            else if hasTypedNumber == true {
                calculate()
                operatorString = "*"
                value1 = 0
                updateUI()
                print(value1, runningTotal)
                hasTypedNumber = false
                return
            }
            
        }
        
        
        @IBAction func divisionButton(sender: BorderButton) {
            if hasPerformedCalculation == true {
                operatorString = "/"
                value1 = 0
                updateUI()
                hasPerformedCalculation = false
                print(value1, runningTotal)
                hasTypedNumber = false
                return
            }
            if isFirstTap == true {
                operatorString = "/"
                runningTotal = value1
                value1 = 0
                isFirstTap = false
                updateUI()
                print(value1, runningTotal)
                hasTypedNumber = false
                return
            }
            else if hasTypedNumber == true {
                calculate()
                operatorString = "/"
                value1 = 0
                updateUI()
                print(value1, runningTotal)
                hasTypedNumber = false
                return
            }
        }
        
        
        @IBAction func minusButtonTapped(sender: BorderButton) {
            
            print("minusButtonTapped")
            
            if hasPerformedCalculation == true {
                operatorString = "-"
                value1 = 0
                updateUI()
                hasPerformedCalculation = false
                hasTypedNumber = false
                return
            }
            if isFirstTap == true {
                operatorString = "-"
                runningTotal = value1
                value1 = 0
                updateUI()
                isFirstTap = false
                hasTypedNumber = false
                return
            } else {
                calculate()
                operatorString = "-"
                value1 = 0
                updateUI()
                hasTypedNumber = false
                return
            }
            
        }
        
        
        @IBAction func numberButtons(sender: BorderButton) {
            
            value2 = 0
            value1 = ((value1 * 10) + Double(sender.tag))
            runningTotalLabel.text = "\(value1)"
            print(value1, runningTotal)
            hasTypedNumber = true
            
        }
        
        
        @IBAction func clearButton(sender: BorderButton) {
            runningTotal = 0
            value1 = 0
            value2 = 0
            operatorString = ""
            isFirstTap = true
            hasPerformedCalculation = false
            hasTypedNumber = false
            updateUI()
        }
        
        @IBAction func sqrtButton(sender: BorderButton) {
            if hasTypedNumber == true {
                calculate()
                value1 = 0
                operatorString = "sqrt"
                print(value1, runningTotal)
                calculate()
                hasTypedNumber = false
                updateUI()
            }
            
        
        }
        @IBAction func equalsButtonTapped(sender: BorderButton) {
            
            calculate()
            value1 = 0
            updateUI()
            hasPerformedCalculation = true
            hasTypedNumber = false
            print(value1, runningTotal)
        }
        
        @IBAction func percentButton(sender: UIButton) {
            if hasPerformedCalculation == false {
            runningTotal = value1 / 100
            value1 = 0
            hasTypedNumber = false
            print(value1, runningTotal)
            return
        }
            runningTotal = runningTotal / 100
            value1 = 0
            print(value1, runningTotal)
        }
     
        @IBAction func negativeButton(sender: BorderButton) {
        operatorString = "(-)"
        if hasPerformedCalculation == false {
                runningTotal = value1 * -1
                value1 = 0
                print(value1, runningTotal)
                updateUI()
            hasTypedNumber = false
            return
            } else {
            runningTotal = runningTotal * -1
            value1 = 0
            updateUI()
            print(value1, runningTotal)
            hasTypedNumber = false
        }
        }
        
        
        func updateUI() {
            
            runningTotalLabel.text = "\(runningTotal)"
        }
        
        func convertStringToDouble(str: String?) -> Double {
            
            var returnDouble: Double = 0
            
            if str == nil || str == "" {
                return returnDouble
            }
            
            returnDouble = Double(str!)!
            
            return returnDouble
        }
        
        func calculate () {
            
            if operatorString == "+" {
                runningTotal = runningTotal + value1
                return
            }
            if operatorString == "(-)" {
                return
            }
            if operatorString == "-" {
                runningTotal = runningTotal - value1
                return
            }
            if operatorString == "*" {
                runningTotal = runningTotal * value1
                return
            }
            if operatorString == "/" {
                runningTotal = runningTotal / value1
                return
            }
            if operatorString == "sqrt" {
                runningTotal = sqrt(runningTotal)
                return
            }
            if operatorString == "%" {
                runningTotal = runningTotal / 100
                return
            }
            if hasPerformedCalculation == false || operatorString == "" {
                runningTotal = value1
            }
            
            
        }
        
}

