//
//  calculatorBrain.swift
//  Calculator
//
//  Created by Sean Calkins on 2/12/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class CalculatorBrain {
    
    var runningTotal: Double = 0
    
    var firstNumber: Double = 0
    
    var secondNumber: Double = 0
    
    var hasTypeValue: Bool = false
    
    func passStringToBrain(str: String) {
        
        let value = self.convertsStringToDouble(str)
        
        if hasTypeValue == false {
            self.firstNumber = value
        } else {
            self.secondNumber = value
        }
        
        
        
    }
    
    func calculate(value1: Double, value2: Double, operatorString: String) -> Double {
        
        var result: Double = 0
        
        if operatorString == "+" {
            result = value1 + value2
        }
        if operatorString == "-" {
            result = value2 - value1
        }
        if operatorString == "÷" {
            result = value1 / value2
        }
        if operatorString == "x" {
            result = value1 * value2
        }
        if operatorString == "x^2" {
            result = value1 * value1
        }
        if operatorString == "x^y" {
            pow(value1, value2)
        }
        if operatorString == "sqrt" {
            result = sqrt(value1)
        }
        if operatorString == "π" {
            result = 3.1415926536
        }
        if operatorString == "%" {
            result = value1/100
        }
        if operatorString == "(0)" {
            result = value1 * -1
        }
        if operatorString == "|x|" {
            if value1 < 0 {
                result = result * -1
            } else {
                result = value1
            }
        }
        if operatorString == "" {
            result = value1
        }
        
        return result
    }
    
    
    
    
    
    func convertsStringToDouble(str: String?) -> Double {
        
        var doubleValue: Double = 0
        
        if str == nil || str == "" {
            return doubleValue
        } else {
            if let str = str {
                doubleValue = Double(str)!
            }
        }
        return doubleValue
    }
    
}






    







