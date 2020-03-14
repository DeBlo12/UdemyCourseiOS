//
//  main.swift
//  protocols and delegates
//
//  Created by Ivo Specht on 25/01/2020.
//  Copyright © 2020 Ivo Specht. All rights reserved.
//

/* Protocols and Delegates Tutorial
 Enableds Protocols to be used as data type, protocols work on structs, inhertiance does not.
 
 */


protocol AdvancedLifeSupport {
    func performCPR()
}


class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("What happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
    
}


struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    
    func performCPR() {
        print("Performing CPR")
    }
}

let emilia = EmergencyCallHandler()

let pete = Paramedic(handler: emilia)

emilia.assessSituation()
emilia.medicalEmergency()
pete.performCPR()
