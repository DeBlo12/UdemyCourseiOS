//
//  Dragon.swift
//  ClassesDeepDive
//
//  Created by Ivo Specht on 08/12/2019.
//  Copyright © 2019 Ivo Specht. All rights reserved.
//

import Foundation

class Dragon: Enemy {
    
    override func attack() {
        super.attack()
        print("Breathes Fire. Does double damage \(attackStrength * 2).")
    }
    
}
