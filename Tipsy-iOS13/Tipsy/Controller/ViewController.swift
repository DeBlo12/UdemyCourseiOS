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
    
    // ButtonOutlets
    @IBOutlet weak var zeroPercentTip: UIButton!
    @IBOutlet weak var tenPercentTip: UIButton!
    @IBOutlet weak var twentyPercentTip: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChoice(_ sender: UIButton) {
        
        
        guard let tipChosen = sender.currentTitle else { return }
        
        
        let tipAmount: Float?
        
        switch tipChosen {
        case "0%":
            tipAmount = 0.0
            zeroPercentTip.isSelected = true
        case "20%":
            tipAmount = 0.2
            twentyPercentTip.isSelected = true
        default:
            tipAmount = 0.1
            tenPercentTip.isSelected = true
        }
        
        
    }
    
    @IBAction func choosePeopleCount(_ sender: UIStepper) {
        
        
        
    }
    

}

