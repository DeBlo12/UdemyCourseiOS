//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Ivo Specht on 09/04/2020.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (firstNum: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func performTwoNumCalculation(secondNum: Double) -> Double? {
       
        if let firstNum = intermediateCalculation?.firstNum, let operation = intermediateCalculation?.operation {
            
            switch operation {
            case "+":
                return firstNum + secondNum
            case "-":
                return firstNum - secondNum
            case "x":
                return firstNum * secondNum
            case "/":
                return firstNum / secondNum
            default:
                fatalError("No operation passed")
            }
        }
        return nil
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "%" {
                return n * 0.01
            } else if symbol == "AC" {
                return 0
            } else if symbol == "=" {
                return performTwoNumCalculation(secondNum: n)
            } else {
                intermediateCalculation = (firstNum: n, operation: symbol)
            }
        }
        
        
        return nil
    }
    
    
}
