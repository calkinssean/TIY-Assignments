//
//  ViewController.swift
//  OutaTime
//
//  Created by Sean Calkins on 2/4/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit






class ViewController: UIViewController {
  
    var timer: NSTimer?
    var count: Int = 0
    let speed: NSTimeInterval = 0.1
    
    @IBOutlet weak var DestinationTimeLabel: UILabel!

    @IBOutlet weak var PresentTimeLabel: UILabel!
    
    @IBOutlet weak var LastTimeDeparted: UILabel!
    
    @IBOutlet weak var SpeedLabel: UILabel!
    
    @IBAction func travelBack(sender: UIButton) {
        timer = NSTimer.scheduledTimerWithTimeInterval(speed, target: self, selector: "updateSpeed", userInfo: nil, repeats: true)
        updateSpeed()
        
    }
    
    
    
    func updateSpeed() {
        
        if count <= 88 {
            SpeedLabel.text = "\(count) MPH"
        count++
        } else {
            SpeedLabel.text = "LIGHTNING!"
            performSegueWithIdentifier("JRBoy", sender: self)
            timer?.invalidate()
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dates()
        updateSpeed()
    }
    
    
    func dates() {
        let today = NSDate()
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "MMM-dd-yyyy"
        
        let todayString = dateFormatter.stringFromDate(today)
        
        todayString.uppercaseString
        PresentTimeLabel.text = todayString
        
    }
    
    
    @IBAction func getTheDate (segue: UIStoryboardSegue){
        if segue.identifier == "getTheDateSegue" {
        
        let dateFromView2 = segue.sourceViewController as! DatePickerViewController
        let newStr = dateFromView2.destinationDate
        DestinationTimeLabel.text = newStr
        }
        
        
        
    }
    @IBAction func weNeedRoadsAgain (segue: UIStoryboardSegue) {
        if segue.identifier == "onTheRoadAgain" {
            LastTimeDeparted.text = PresentTimeLabel.text
            PresentTimeLabel.text = DestinationTimeLabel.text
            count = 0
            SpeedLabel.text = "\(count)"
        }
    }



   
}







