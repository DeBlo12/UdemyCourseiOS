//
//  ResultVC.swift
//  Tipsy
//
//  Created by Ivo Specht on 14/12/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var costPPLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func recalculateBtn(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
