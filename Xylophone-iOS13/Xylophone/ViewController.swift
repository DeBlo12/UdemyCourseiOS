//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    // Sound library
    let soundLibrary = ["C.wav","D.wav","E.wav","F.wav","G.wav","A.wav","B.wav"]
    
    var xylophoneSoundsPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    fileprivate func playSound(_ sender: UIButton) {
        guard let path = Bundle.main.path(forResource: soundLibrary[sender.tag], ofType: nil) else {return}
        let url = URL(fileURLWithPath: path)
        
        do {
            xylophoneSoundsPlayer = try AVAudioPlayer(contentsOf: url)
            xylophoneSoundsPlayer?.play()
        } catch {
            
        }
    }

    
    
    // Note Buttons
    @IBAction func noteBtn(_ sender: UIButton) {
        print(sender.currentTitle ?? "note")
        playSound(sender)
        
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
        
    }
    
    

}

