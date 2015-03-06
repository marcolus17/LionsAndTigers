//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Nicholas Markworth on 2/24/15.
//  Copyright (c) 2015 Nick Markworth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    
    // Array used to hold the tiger instances
    var myTigers:[Tiger] = []
    // Keeps track of the current tiger loaded in the view
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Initial load of tigers
        self.loadTigers()
    }
    
    // Load the tigers into the array property
    func loadTigers() {
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named:"MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named:"SiberianTiger.jpg")
        
        myTigers += [myTiger, secondTiger, thirdTiger, fourthTiger]
        self.changeTiger()
    }
    
    // Grab a random tiger from the array
    func changeTiger() {
        if myTigers.count > 0 {
            var randomIndex:Int
            
            // Make sure the new, random tiger is not the same as the current one
            do {
                randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            } while currentIndex == randomIndex
            
            currentIndex = randomIndex
            let tiger = myTigers[randomIndex]
            self.updateView(tiger)
        }
        else {
            self.loadTigers()
        }
    }
    
    // Update the view with a new tiger using animation
    func updateView(tiger : Tiger) {
        UIView.transitionWithView(
            self.view,
            duration: 1,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                self.mainImageView.image = tiger.image
                self.nameLabel.text = tiger.name
                self.ageLabel.text = "\(tiger.age)"
                self.breedLabel.text = tiger.breed
            },
            completion: {
                (finished: Bool) -> () in
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // User pressed the next button to change the image on the screen
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        self.changeTiger()
    }
    
}

