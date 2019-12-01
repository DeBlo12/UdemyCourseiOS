//
//  ViewController.swift
//  IamRich
//
//  Created by Ivo Specht on 17/11/2019.
//  Copyright © 2019 Ivo Specht. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // outlets
    
    
    @IBOutlet weak var mainLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        mainLabel.text = "I am Rich."
        mainLabel.textColor = .white
        
    }
    



}


