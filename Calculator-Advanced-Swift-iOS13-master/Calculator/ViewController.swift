//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isfinishedTypingNumber: Bool = true
    
    var numbersToBeCalculated = [Double]()
    var newNumber = ""
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        if let operation = sender.currentTitle {
            print(operation)
            isfinishedTypingNumber = true
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let number = sender.currentTitle {
            
            if isfinishedTypingNumber {
                displayLabel.text = number
                isfinishedTypingNumber = false
            } else {
                displayLabel.text = displayLabel.text! + number
                
                if isfinishedTypingNumber == true {
                    if let numTobeAdded = displayLabel.text {
                        newNumber = numTobeAdded
                        print(newNumber)
                    }
                        
                }
                
            }
            
            
        }
        
        
    
    }

}

