//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bmiValue = "0.0"
    var bmiBrain = BMIBrain()
    
    //Outlets
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
     
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func heightChangedSlider(_ sender: UISlider) {
        
        let heightString = String(format: "%.2f", sender.value)
        heightLabel.text = "\(heightString) M"
    }
    
    @IBAction func weightChangeSlider(_ sender: UISlider) {
        
        let weightString = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weightString) KG"
    }
    
    
    
    @IBAction func calculateBMIBtn(_ sender: UIButton) {
        
        let heightChosen = heightSlider.value
        let weightChosen = weightSlider.value
        
        bmiBrain.calculateBMI(weight: weightChosen, height: heightChosen)
        
        performSegue(withIdentifier: "goToResults", sender: self)
        
             
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultVC
            destinationVC.bmiValue = bmiBrain.getBMIValue()
            
        }
        
        
    }

}

