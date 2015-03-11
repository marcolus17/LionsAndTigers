//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Nicholas Markworth on 2/24/15.
//  Copyright (c) 2015 Nick Markworth. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    // Cannot update properties within a struct, but can access
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named: "default.jpg")
    
    // Example of an instance function
    func chuff() {
        println("\(self.name): Chuff Chuff")
    }
    
    // Can call other functions inside a struct
    func chuffANumberOfTimes(number: Int) {
        for var chuff = 0; chuff < number; chuff++ {
            // Must use the self keyword to avoid conflict with the counter variable
            self.chuff()
        }
    }
    
    // Example of a function that returns a value
    func ageInTigerYearsFromAge(regularAge: Int) -> Int {
        return regularAge * 3
    }
}