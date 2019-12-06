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
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLbl: UILabel!
    
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        scoreLbl.font = UIFont.init(name: "Helvetica Neue", size: 20)
        scoreLbl.textColor = .white
        
    }

    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        guard let userAnswer = sender.currentTitle else {return}
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            print("right!")
            sender.backgroundColor = UIColor.green
        } else {
            print("wrong!")
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLbl.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
        scoreLbl.text = "Score: \(quizBrain.getUserScore())"
        
    }
    
}

