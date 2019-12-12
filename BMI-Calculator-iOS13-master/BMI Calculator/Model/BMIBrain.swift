//
//  BMIBrain.swift
//  BMI Calculator
//
//  Created by Ivo Specht on 11/12/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit


struct BMIBrain {
   
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiFormatted = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiFormatted
    }
    
    mutating func calculateBMI(weight: Float, height: Float) {
        let bmiValue = weight / pow(height, 2)
        
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Continue like you are", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies.", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice"
    }
}
