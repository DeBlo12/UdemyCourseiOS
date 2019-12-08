//
//  Enemy.swift
//  ClassesDeepDive
//
//  Created by Ivo Specht on 08/12/2019.
//  Copyright © 2019 Ivo Specht. All rights reserved.
//

import Foundation

class Enemy {
    
    var health: Int
    var attackStrength: Int
    
    
    func move() {
        print("Walks.")
    }
    
    func attack() {
        print("Lands a hit. Does \(attackStrength) damage.")
    }
    
    init(health: Int, attackStrength: Int) {
        self.health = health
        self.attackStrength = attackStrength
    }
}
