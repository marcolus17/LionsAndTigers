//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Nicholas Markworth on 3/31/15.
//  Copyright (c) 2015 Nick Markworth. All rights reserved.
//

import Foundation

// Subclass of the Lion class
class LionCub: Lion {
    // Overrides the roar() function in the superclass Lion
    override func roar() {
        // super.roar() // calls the function in the superclass
        println("LionCub: Growl Growl")
    }
}