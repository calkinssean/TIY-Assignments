//
//  ViewController.swift
//  Counter
//
//  Created by Phil Wright on 1/30/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
  
    var currentCount: Int = Int(arc4random() % 100)
   
    @IBOutlet weak var countTextField: UITextField!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var stepper: UIStepper!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateViewsWithCurrentCount()
        
    }

    override func didReceiveMemoryWarning()
    {
    }
    
    func updateViewsWithCurrentCount()
    {
        countTextField.text = "\(currentCount)"
        slider.value = Float(currentCount)
        stepper.value = Double(currentCount)
    }
    
   
    
    @IBAction func viewTapped(sender: UITapGestureRecognizer)
    {
      
        if countTextField.isFirstResponder()
        {
            countTextField.resignFirstResponder()
                       updateViewsWithCurrentCount()
        }
    }
    
   
    
    
    @IBAction func slider(sender: UISlider) {
        currentCount = Int(sender.value)
        updateViewsWithCurrentCount()
    }
    
    @IBAction func stepper(sender: UIStepper)
    {
        currentCount = Int(sender.value)
        updateViewsWithCurrentCount()
    }
}