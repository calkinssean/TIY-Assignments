//
//  ViewController.swift
//  Calculator
//
//  Created by Sean Calkins on 2/10/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bigLabel: UILabel!
    @IBOutlet weak var littleLabel: UILabel!
    
    var currentNumber: Float = 0
    var currentTotal: Float = 0
    var count = 0
    var functionVar: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func updateUI() {
        littleLabel.text = "\(currentTotal)"
        bigLabel.text = "\(currentNumber)"
    }
    
    //MARK: - Number Buttons
    
    @IBAction func numberOne(sender: BorderButton) {
        currentNumber = (currentNumber * 10) + 1
        updateUI()
    }
    @IBAction func numberTwo(sender: BorderButton) {
        currentNumber = (currentNumber * 10) + 2
        updateUI()
    }
    @IBAction func numberThree(sender: BorderButton) {
        currentNumber = (currentNumber * 10) + 3
        updateUI()
    }
    @IBAction func numberFour(sender: BorderButton) {
        currentNumber = (currentNumber * 10) + 4
        updateUI()
    }
    @IBAction func numberFive(sender: BorderButton) {
        currentNumber = (currentNumber * 10) + 5
        updateUI()
    }
    @IBAction func numberSix(sender: BorderButton) {
        currentNumber = (currentNumber * 10) + 6
        updateUI()
    }
    @IBAction func numberSeven(sender: BorderButton) {
        currentNumber = (currentNumber * 10) + 7
        updateUI()
    }
    @IBAction func numberEight(sender: BorderButton) {
        currentNumber = (currentNumber * 10) + 8
        updateUI()
    }
    @IBAction func numberNine(sender: BorderButton) {
        currentNumber = (currentNumber * 10) + 9
        updateUI()
    }
    @IBAction func numberZero(sender: BorderButton) {
        currentNumber = (currentNumber * 10)
        updateUI()
    }
    
    //MARK: - Method Buttons
    
    @IBAction func decimalButton(sender: BorderButton) {
    }
    @IBAction func negativeButton(sender: BorderButton) {
        currentNumber = (currentNumber * -1)
        updateUI()
    }
    @IBAction func equalsButton(sender: BorderButton) {
        currentTotal = currentNumber
        littleLabel.text = "\(functionVar + currentNumber)"
        currentNumber = 0
        updateUI()
    }
    @IBAction func clearButton(sender: BorderButton) {
        count++
        if count == 1 {
            currentNumber = 0
            updateUI()
            print(count)
        } else if count == 2 {
            currentTotal = 0
            currentNumber = 0
            updateUI()
            count = 0
        }
    }
    @IBAction func parenthesesButton(sender: BorderButton) {
    }
    @IBAction func percentButton(sender: BorderButton) {
    }
    @IBAction func divideButton(sender: BorderButton) {
    }
    @IBAction func multiplyButton(sender: BorderButton) {
    }
    @IBAction func subtractButton(sender: BorderButton) {
    }
    @IBAction func addButton(sender: BorderButton) {
        bigLabel.text = "\(currentNumber) + "
        currentNumber = functionVar
        currentNumber = 0
    }
    
 
    
    
    
    
    
    
    


}

