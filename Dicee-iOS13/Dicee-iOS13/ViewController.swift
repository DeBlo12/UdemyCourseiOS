//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // Outlets
    @IBOutlet weak var leftDice: UIImageView!
    @IBOutlet weak var rightDice: UIImageView!
    @IBOutlet weak var paschLabel: UILabel!
    
    
    var diceList = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        paschLabel.isHidden = true
        
    }
   
   
    //Buttons
    
    @IBAction func rollDiceBtn(_ sender: Any) {
        
        let randomNumberleft = Int.random(in: 0..<6)
        let randomNumberRight = Int.random(in: 0..<6)
        
        if randomNumberleft == randomNumberRight {
            paschLabel.text = "You've rolled a pasch. Double the points"
            paschLabel.isHidden = false
        } else {
            paschLabel.isHidden = true
        }
        
        leftDice.image = UIImage(named: diceList[randomNumberleft])
        rightDice.image = UIImage(named: diceList[randomNumberRight])
        
        print(randomNumberleft, randomNumberRight)
        
    }
}

