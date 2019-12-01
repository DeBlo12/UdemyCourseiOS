//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ballImageView: UIImageView!
    
    let ballArray = [#imageLiteral(resourceName: "ball4"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]


    @IBAction func askBTN(_ sender: UIButton) {
        
        let randomBall = Int.random(in: 0..<5)
        var randomNumberArray = [0]
        
        if randomBall != randomNumberArray.last {
            ballImageView.image = ballArray[randomBall]
            randomNumberArray.append(randomBall)
        } else {
            let secondDraw = Int.random(in: 0..<5)
            ballImageView.image = ballArray[secondDraw]
            randomNumberArray.append(secondDraw)
        }
        
        print(randomNumberArray)
    }
    
}

