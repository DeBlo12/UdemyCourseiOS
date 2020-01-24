//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var billTotalTxtfield: UITextField!
    @IBOutlet weak var personCountLbl: UILabel!
    
    var peoplecount     = 0
    var tipAmount       = 0.0
    var billTotal       = 0.0
    var finalAmount     = "0.0"
    
    // ButtonOutlets
    @IBOutlet weak var zeroPercentTip: UIButton!
    @IBOutlet weak var tenPercentTip: UIButton!
    @IBOutlet weak var twentyPercentTip: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChoice(_ sender: UIButton) {
        
        zeroPercentTip.isSelected = false
        tenPercentTip.isSelected = false
        twentyPercentTip.isSelected = false
        sender.isSelected = true
        
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tipAmount = buttonTitleAsANumber / 100

        
    }
    
    @IBAction func choosePeopleCount(_ sender: UIStepper) {
        
        personCountLbl.text = String(format: "%0.f", sender.value)
        peoplecount = Int(sender.value)
        
    }
    
    @IBAction func calculateSplit(_ sender: UIButton) {
        if let bill = billTotalTxtfield.text {
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + tipAmount) / Double(peoplecount)
            finalAmount = String(format: "%.2f", result)
        } else {return}
        
        self.performSegue(withIdentifier: "GoToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "GoToResults" {
            
            let destinationVC = segue.destination as! ResultVC

            destinationVC.result    = finalAmount
            destinationVC.split     = peoplecount
            destinationVC.tip       = Int(tipAmount * 100)	
            
        }
    }

}

