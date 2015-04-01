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
    //Array used to hold the lion instances
    var myLions:[Lion] = []
    // Array used to hold the lion cub instances
    var myLionCubs:[LionCub] = []
    // Keeps track of the current tiger loaded in the view
    var currentIndex = 0
    // A tuple used to store the current animal
    var currentAnimal = (species: "Tiger", index: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Initial load of tigers
        self.loadTigers()
        // Initial load of lions
        self.loadLions()
        // Initial load to the view
        self.updateAnimal()
        self.updateView()
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
    }
    
    // Load the lions into the array property
    func loadLions() {
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale = true
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        
        myLionCubs += [lionCub, femaleLionCub]
        myLions += [lion, lioness]
    }
    
    // Switch between tigers and lions for the new image
    func updateAnimal() {
        switch currentAnimal {
        case ("Tiger", _) :
            let randomIndex = Int(arc4random_uniform(UInt32(myLions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _) :
            let randomIndex = Int(arc4random_uniform(UInt32(myLionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default :
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    
    // Update the view with a new tiger using animation
    func updateView() {
        UIView.transitionWithView(
            self.view,
            duration: 1,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                if self.currentAnimal.species == "Tiger" {
                    let tiger = self.myTigers[self.currentAnimal.index]
                    self.mainImageView.image = tiger.image
                    self.breedLabel.text = tiger.breed
                    self.ageLabel.text = "\(tiger.age)"
                    self.nameLabel.text = tiger.name
                }
                else if self.currentAnimal.species == "LionCub" {
                    let lionCub = self.myLionCubs[self.currentAnimal.index]
                    self.mainImageView.image = lionCub.image
                    self.breedLabel.text = lionCub.subspecies
                    self.ageLabel.text = "\(lionCub.age)"
                    self.nameLabel.text = lionCub.name
                }
                else {
                    let lion = self.myLions[self.currentAnimal.index]
                    self.mainImageView.image = lion.image
                    self.breedLabel.text = lion.subspecies
                    self.ageLabel.text = "\(lion.age)"
                    self.nameLabel.text = lion.name
                }
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
        self.updateAnimal()
        self.updateView()
    }
    
}

