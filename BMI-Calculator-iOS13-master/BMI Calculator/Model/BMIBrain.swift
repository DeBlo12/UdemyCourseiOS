//
//  BMIBrain.swift
//  BMI Calculator
//
//  Created by Ivo Specht on 11/12/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import Foundation


struct BMIBrain {
   
    var bmi: Float = 0.0
    
    func getBMIValue() -> String {
        let bmiFormatted = String(format: "%.1f", bmi)
        return bmiFormatted
    }
    
    mutating func calculateBMI(weight: Float, height: Float) {
        bmi = weight / pow(height, 2)
    }
    
    
    
}
