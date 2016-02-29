//
//  CityDetailViewController.swift
//  WeatherOrNot
//
//  Created by Sean Calkins on 2/25/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    var numberFormatter = NSNumberFormatter()
    let dateFormatter = NSDateFormatter()
    var detailCity: City?
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    // MARK: day1 outlets
    @IBOutlet weak var day1Label: UILabel!
    @IBOutlet weak var day1Image: UIImageView!
    @IBOutlet weak var day1High: UILabel!
    @IBOutlet weak var day1Low: UILabel!
    // MARK: day2 outlets
    @IBOutlet weak var day2Label: UILabel!
    @IBOutlet weak var day2Image: UIImageView!
    @IBOutlet weak var day2High: UILabel!
    @IBOutlet weak var day2Low: UILabel!
    // MARK: day3 outlets
    @IBOutlet weak var day3Label: UILabel!
    @IBOutlet weak var day3Image: UIImageView!
    @IBOutlet weak var day3High: UILabel!
    @IBOutlet weak var day3Low: UILabel!
    // MARK: day4 outlets
    @IBOutlet weak var day4Label: UILabel!
    @IBOutlet weak var day4Image: UIImageView!
    @IBOutlet weak var day4High: UILabel!
    @IBOutlet weak var day4Low: UILabel!
    // MARK: day5 outlets
    @IBOutlet weak var day5Label: UILabel!
    @IBOutlet weak var day5Image: UIImageView!
    @IBOutlet weak var day5High: UILabel!
    @IBOutlet weak var day5Low: UILabel!
    // MARK: day6 outlets
    @IBOutlet weak var day6Label: UILabel!
    @IBOutlet weak var day6Image: UIImageView!
    @IBOutlet weak var day6High: UILabel!
    @IBOutlet weak var day6Low: UILabel!
    // MARK: day7 outlets
    @IBOutlet weak var day7Label: UILabel!
    @IBOutlet weak var day7Image: UIImageView!
    @IBOutlet weak var day7High: UILabel!
    @IBOutlet weak var day7Low: UILabel!
    // MARK: day8 outlets
    @IBOutlet weak var day8Label: UILabel!
    @IBOutlet weak var day8Image: UIImageView!
    @IBOutlet weak var day8High: UILabel!
    @IBOutlet weak var day8Low: UILabel!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var citySummaryLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var cityTempLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(detailCity?.icon)
         if detailCity?.icon == "Drizzle" || detailCity?.icon == "rain" {
            self.backgroundImage.image = UIImage(named: "rainBackground")
        }
        if detailCity?.icon == "snow" {
            self.backgroundImage.image = UIImage(named: "snowBackground")
        }
        if detailCity?.icon == "clear-day" {
            self.backgroundImage.image = UIImage(named: "clearDayBackground")
        }
        if detailCity?.icon == "clear-night" {
            self.backgroundImage.image = UIImage(named: "clearNightBackground")
        }
        if detailCity?.icon == "fog" || detailCity?.icon == "foggy-day" || detailCity?.icon == "foggy-night" {
            self.backgroundImage.image = UIImage(named: "fogBackground")
        }
        if detailCity?.icon == "partly-cloudy-day" {
            self.backgroundImage.image = UIImage(named: "partlyCloudyBackground")
        }
        if detailCity?.icon == "partly-cloudy-night" {
            self.backgroundImage.image = UIImage(named: "partlyCloudyNight")
        }
        if detailCity?.icon == "wind" {
            self.backgroundImage.image = UIImage(named: "windyBackground")
        }
        if detailCity?.icon == "cloudy" {
            self.backgroundImage.image = UIImage(named: "cloudyBackground")
        }
        
        numberFormatter.maximumFractionDigits = 0
        
        //MARK: setting up current weather
        if let i = (self.detailCity?.icon) {
            iconImage.image = UIImage(named: "\(i)")
            print(i)
        }
        if let c = detailCity?.temperature {
            self.cityTempLabel.text = "\(numberFormatter.stringForObjectValue(c)!)°F"
        }
        self.cityNameLabel.text = detailCity?.formatted_address
        self.citySummaryLabel.text = detailCity?.summary
        self.dateFormatter.dateFormat = "EEE, MMM d"
        
        
        //MARK: Day 1 view
        
        self.day1Image.image = UIImage(named: "\(detailCity!.weatherArray[0].icon)")
        print(detailCity!.weatherArray[0].icon)
        let day1time = NSTimeInterval(detailCity!.weatherArray[0].time)
        let day1date = timestampToDate(day1time)
        self.day1Label.text = dateFormatter.stringFromDate(day1date)
        self.day1Low.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[0].temperatureMin))!)°F"
        self.day1High.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[0].temperatureMax))!)°F"
        
        //MARK: Day 2 view
        
        self.day2Image.image = UIImage(named: "\(detailCity!.weatherArray[1].icon)")
        print(detailCity!.weatherArray[1].icon)
        let day2time = NSTimeInterval(detailCity!.weatherArray[1].time)
        let day2date = timestampToDate(day2time)
        self.day2Label.text = dateFormatter.stringFromDate(day2date)
        self.day2Low.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[1].temperatureMin))!)°F"
        self.day2High.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[1].temperatureMax))!)°F"
        
        //MARK: Day 3 view
        
        self.day3Image.image = UIImage(named: "\(detailCity!.weatherArray[2].icon)")
        print(detailCity!.weatherArray[2].icon)
        let day3time = NSTimeInterval(detailCity!.weatherArray[2].time)
        let day3date = timestampToDate(day3time)
        self.day3Label.text = dateFormatter.stringFromDate(day3date)
        self.day3Low.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[2].temperatureMin))!)°F"
        self.day3High.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[2].temperatureMax))!)°F"
        
        //MARK: Day 4 view
        
        self.day4Image.image = UIImage(named: "\(detailCity!.weatherArray[3].icon)")
        print(detailCity!.weatherArray[3].icon)
        let day4time = NSTimeInterval(detailCity!.weatherArray[3].time)
        let day4date = timestampToDate(day4time)
        self.day4Label.text = dateFormatter.stringFromDate(day4date)
        self.day4Low.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[3].temperatureMin))!)°F"
        self.day4High.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[3].temperatureMax))!)°F"
        
        //MARK: Day 5 view
        
        self.day5Image.image = UIImage(named: "\(detailCity!.weatherArray[4].icon)")
        print(detailCity!.weatherArray[4].icon)
        let day5time = NSTimeInterval(detailCity!.weatherArray[4].time)
        let day5date = timestampToDate(day5time)
        self.day5Label.text = dateFormatter.stringFromDate(day5date)
        self.day5Low.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[4].temperatureMin))!)°F"
        self.day5High.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[4].temperatureMax))!)°F"
        
        //MARK: Day 6 view
        
        self.day6Image.image = UIImage(named: "\(detailCity!.weatherArray[5].icon)")
        print(detailCity!.weatherArray[5].icon)
        let day6time = NSTimeInterval(detailCity!.weatherArray[5].time)
        let day6date = timestampToDate(day6time)
        self.day6Label.text = dateFormatter.stringFromDate(day6date)
        self.day6Low.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[5].temperatureMin))!)°F"
        self.day6High.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[5].temperatureMax))!)°F"
        
        //MARK: Day 7 view
        
        self.day7Image.image = UIImage(named: "\(detailCity!.weatherArray[6].icon)")
        print(detailCity!.weatherArray[6].icon)
        let day7time = NSTimeInterval(detailCity!.weatherArray[6].time)
        let day7date = timestampToDate(day7time)
        self.day7Label.text = dateFormatter.stringFromDate(day7date)
        self.day7Low.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[6].temperatureMin))!)°F"
        self.day7High.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[6].temperatureMax))!)°F"
        
        //MARK: Day 8 view
        
        self.day8Image.image = UIImage(named: "\(detailCity!.weatherArray[7].icon)")
        print(detailCity!.weatherArray[7].icon)
        let day8time = NSTimeInterval(detailCity!.weatherArray[7].time)
        let day8date = timestampToDate(day8time)
        self.day8Label.text = dateFormatter.stringFromDate(day8date)
        self.day8Low.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[7].temperatureMin))!)°F"
        self.day8High.text = "\(numberFormatter.stringForObjectValue((detailCity!.weatherArray[7].temperatureMax))!)°F"
    }
    
    //MARK: Timestamp conversion
    
    func timestampToNSTimeInterval (timestamp: Int) -> Double {
        return NSTimeInterval(timestamp)
    }
    func timestampToDate(timestamp: NSTimeInterval) -> NSDate {
        return NSDate(timeIntervalSince1970: timestamp)
    }
    
}
