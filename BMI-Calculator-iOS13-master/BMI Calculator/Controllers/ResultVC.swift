//
//  ResultVC.swift
//  BMI Calculator
//
//  Created by Ivo Specht on 08/12/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    // Outlets
    @IBOutlet weak var bmiScoreLbl: UILabel!
    @IBOutlet weak var recommendationLbl: UILabel!
    @IBOutlet weak var backgroundColor: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiScoreLbl.text = bmiValue
        recommendationLbl.text = advice
        backgroundColor.backgroundColor = color
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
