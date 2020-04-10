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
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else{ fatalError("Cannot convert")}

            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    } // End of DisplayValue Variable.
    
    private var calculator = CalculatorLogic()

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isfinishedTypingNumber = true
        //What should happen when a non-number button is pressed
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
                
            }
            
        }
        
    } // End of CalcButtonPressed
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let number = sender.currentTitle {
            
            if isfinishedTypingNumber {
                displayLabel.text = number
                isfinishedTypingNumber = false
            } else {
                if number == "." {
                    guard let doubleNumber = Double(displayLabel.text!) else {fatalError("Not convertible to a double")}
                    
                    let isInt = floor(doubleNumber) == doubleNumber
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + number
            }
        }
    } // End of numButtonPressed Function
} // End of ViewController class

