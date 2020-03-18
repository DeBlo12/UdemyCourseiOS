//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    
    /*
     These two options make it so that the nav bar is hidden on this screen, but not on the others.
     
     Overriding the lifecycle methods, you'll want to use a super class.
     
     ViewDidLoad is loaded once, then viewWillAppear (just before view appears on screen.
     Next: ViewDidAppear(), whence VIew has loaded onto UI
     Next: viewWillDisappear(), before View disappears, preloads UI to be gone and new view will loads.
     Next: viewDidDisappear(), view has gone from screen. User can't see view anymore, but did not delete from memory.
     
     
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = Constants.appName

    }
    

}

























// MARK: - Old Versions and old code snippets
//        var charIndex = 0.0
//        let titleText = "⚡️FlashChat"
//
//
//        // Making the Title on the Screen appear One by One
//        for letter in titleText {
//            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
//                self.titleLabel.text?.append(letter)
//            }
//            charIndex += 1
//        }
        
