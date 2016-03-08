//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Sean Calkins on 2/4/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var destinationDate = ""
    
    @IBAction func datePickerAction(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM-dd-yyyy"
        destinationDate = dateFormatter.stringFromDate(datePicker.date)
        print(destinationDate.uppercaseString)
        
    }
    


}
