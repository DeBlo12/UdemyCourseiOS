//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import CoreML
import SwifteriOS

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    let swifter = Swifter(consumerKey: Secrets.apiKey , consumerSecret: Secrets.apiSecretKey)
    let feedArray = [Any]()
    var tweets = [sentimentAnalysisInput]()
    
    let sentimentClassifier = sentimentAnalysis()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let prediction = try! sentimentClassifier.prediction(text: "@apple is the best")
        print(prediction.label)
        
        
    }

    @IBAction func predictPressed(_ sender: Any){
        
        
        guard let searchTerm = textField.text else {return}
        
        swifter.searchTweet(using: searchTerm, lang: "en", count: 100, tweetMode: .extended, success: {(results, metadata) in
           
            if let jsonData = results.description.data(using: .utf8) {
                self.parseJSON(jsonData)
                
            }
            
            do{
                
                let predictions = try self.sentimentClassifier.predictions(inputs: self.tweets)
            
                var sentimentScore = 0
                for prediction in predictions {
                
                    let sentiment = prediction.label
                    
                    if sentiment == "Pos" {
                        sentimentScore += 1
                    } else if sentiment == "Neg" {
                        sentimentScore -= 1
                    }
                }
            
                print(sentimentScore)

            } catch {
                print(error)
            }
            
        }) { (error) in
                print(error)
                return
        }
    
    
    }
    
    func parseJSON(_ Tweets: Data) {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode([Tweet].self, from: Tweets)
            
            for i in decodedData {
                let fullText = i.full_text
                let tweet = Tweet(full_text: fullText)
                let forClassification = sentimentAnalysisInput(text: tweet.full_text)
                print(tweet)
                tweets.append(forClassification)
            }
            
        } catch {
            print(error)
        }
    }
    
}

