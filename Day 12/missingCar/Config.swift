//
//  Config.swift
//  missingCar
//
//  Created by Sean Calkins on 2/17/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import Foundation

class Config {
    
    static let sharedInstance = Config()
    private init() {}
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    let kRedColorValue = "kRedColorValue"
    let kGreenColorValue = "kGreenColorValue"
    let kBlueColorValue = "kBlueColorValue"
    let kAlphaColorValue = "kAlphaColorValue"
    
    let kLastUsedDate = "kLastUsedDate"
    let kFirstUsedDate = "kFirstUsedDate"
    
    let kName = "kName"
    let kMake = "kMake"
    let kModel = "kModel"
    let kYear = "kYear"
    let kLicense = "kLicense"
    
    var redColorValue: Float = 0.5
    var greenColorValue: Float = 0.5
    var blueColorValue: Float = 0.5
    var alphaColorValue: Float = 1.0
    
    var name: String?
    var make: String?
    var model: String?
    var year: String?
    var license: String?
    
    var lastUsedDate: NSDate?
    var firstUSedDate: NSDate?
    
    func saveConfiguration() {
        print("Save config called")
        self.printValues()
        let checkFirstDate = self.defaults.objectForKey(kFirstUsedDate) as? NSDate
        
        if checkFirstDate == nil {
            self.firstUSedDate = NSDate()
            self.defaults.setObject(self.firstUSedDate, forKey: kFirstUsedDate)
        }
        
        self.defaults.setObject(self.lastUsedDate, forKey: kLastUsedDate)
        
        self.defaults.setValue(self.name, forKey: self.kName)
        self.defaults.setValue(self.make, forKey: self.kMake)
        self.defaults.setValue(self.model, forKey: self.kModel)
        self.defaults.setValue(self.year, forKey: self.kYear)
        self.defaults.setValue(self.license, forKey: self.kLicense)
        
        self.defaults.setFloat(self.redColorValue, forKey: kRedColorValue)
        self.defaults.setFloat(self.greenColorValue, forKey: kGreenColorValue)
        self.defaults.setFloat(self.blueColorValue, forKey: kBlueColorValue)
        self.defaults.setFloat(self.alphaColorValue, forKey: kAlphaColorValue)
        print("save config finished")
        self.printValues()
    }
    func loadConfiguraton() {
        print("loadConfiguraton called")
        self.printValues()
        self.firstUSedDate = self.defaults.objectForKey(kFirstUsedDate) as? NSDate
        self.lastUsedDate = self.defaults.objectForKey(kLastUsedDate) as? NSDate
        
        self.name = defaults.stringForKey(kName)
        self.make = defaults.stringForKey(kMake)
        self.model = defaults.stringForKey(kModel)
        self.year = defaults.stringForKey(kYear)
        self.license = defaults.stringForKey(kLicense)
        
        self.redColorValue = defaults.floatForKey(kRedColorValue)
        self.greenColorValue = defaults.floatForKey(kGreenColorValue)
        self.blueColorValue = defaults.floatForKey(kBlueColorValue)
        self.alphaColorValue = defaults.floatForKey(kAlphaColorValue)
        print("load config finished")
        self.printValues()
    }
    
    func printValues() {
        print(self.redColorValue)
        print(self.greenColorValue)
        print(self.blueColorValue)
        
        print(self.name)
        print(self.make)
        print(self.model)
        print(self.year)
        print(self.license)
    
    }
    
    
    
    
}
