//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var eggStatusLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
  
// individual values
//    let softTime    = 5
//    let mediumTime  = 7
//    let hardTime   = 12
    
    
    // Dictionary
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
    
    var secondsRemaining = 60
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    
    var alarmSound = AVAudioPlayer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        
        // Dict solution to print out the time.
        guard let hardness = sender.currentTitle else {return}
        
        totalTime = eggTimes[hardness]!
        

        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        eggStatusLbl.text = "This is going to take \(totalTime) minutes."
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = percentageProgress
            print(percentageProgress)
            secondsPassed += 1

                    
        } else if secondsPassed == totalTime{
            progressBar.progress = 1.0
            timer.invalidate()
            eggStatusLbl.text = "Done!"
            
            let sound = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                
                do {
                    alarmSound = try AVAudioPlayer(contentsOf: sound!)
                    alarmSound.play()
                } catch {}
            
            } else {
            timer.invalidate()
            eggStatusLbl.text = "DONE!"
            print("Egg is done.")
                }
    }
    
}
