//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

/* Delegates and Protocols Explained
 Delegates
 
 Protocols: Certificates that something can use something
 Protocol methods must not have bodies (func fly()), implementation must be done in the class.
 Can be adopted by Structs and Classes, vs. inheritance (class only)
 
 
 */

class WeatherViewController: UIViewController{

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    //txtfields
    @IBOutlet weak var searchTF: UITextField!
    
    //Creation of Class Instances
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTF.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
       

    }
   
    @IBAction func getCurrentLocation(_ sender: UIButton) {
        locationManager.requestLocation()
        
    }
    
}


// MARK: - Extension UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTF.endEditing(true)
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
        
        // Use searchTF.text to get Weather for theat city.
        
        if let city = searchTF.text {
            
            let cleanedCity = city.replacingOccurrences(of: " ", with: "+")
            weatherManager.fetchWeatherCityName(cityName: cleanedCity)
        }
        textField.text = ""
    }
}


// MARK: - Extension WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
        
       func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
           DispatchQueue.main.async {
               self.temperatureLabel.text = weather.temperatureString
               self.cityLabel.text = weather.cityName
               self.conditionImageView.image = UIImage(systemName: weather.conditionName)
           }
           
       }
       
       func didFailWithError(error: Error) {
           print(error)
       }

       
    
}
 // MARK: - Extension CLLocationmanagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
 
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Got Location Data")

        if let location = locations.last {
            let lon = location.coordinate.longitude
            let lat = location.coordinate.latitude
            print(lat, lon)
            print(type(of: lat))

            weatherManager.fetchWeatherCoordinates(latitude: lat, longitude: lon)

        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
