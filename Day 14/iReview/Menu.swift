//
//  Menu.swift
//  iReview
//
//  Created by Sean Calkins on 2/18/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import Foundation

class Menu {
    var menuName: String = ""
    var menuItems = [Dish]()
    
    init(dict: JSONDictionary) {
        if let menuName = dict["menuName"] as? String {
            self.menuName = menuName
            print(menuName)
            if let results = dict["dishes"] as? JSONArray {
                for result in results {
                    let m = Dish(dict: result)
                    self.menuItems.append(m)
                    print("dishes appended")
                }
                
            } else {
                print("error with menuName")
            }
            
        }
    }
}