//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    //txtfields
    @IBOutlet weak var searchTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchTF.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTF.endEditing(true)
        guard let searchedCity = searchTF.text else {return}
        print(searchedCity)
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTF.endEditing(true)
        print(searchTF.text!)
        
        return true
    }
    
    
    // Use general textField here, as it would jump to the selected textField through the system.
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Write something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        textField.text = ""
        
    }
    
    
    
    
    
    @IBAction func currentLocationPressed(_ sender: UIButton) {
        
        
    }
    
    
}

