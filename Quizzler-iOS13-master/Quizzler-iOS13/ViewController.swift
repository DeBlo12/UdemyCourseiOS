//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var progressViewBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    
    var questionArray = [
        ["5 + 2 = 7?", "True"],
        ["Does the Sun revolve around the Earth?", "False"],
        ["How many Pushups does Chuck Norris do?", "True"]
    ]
    
    var questionNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }

    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer = questionArray[questionNumber][1]
        
        if userAnswer == actualAnswer {
            print("right!")
        } else {
            print("wrong!")
        }
        
        if questionNumber + 1 < questionArray.count {
            questionNumber += 1
            updateUI()
        } else {
            questionNumber = 0
            updateUI()
        }
    }
    
    func updateUI() {
        
     questionLbl.text = questionArray[questionNumber][0]
        
    }
    
}

