//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Ivo Specht on 17/03/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

    
    // Static turns properties from instance variable to type property, so it can be used without initialising a new instance in a file. Same ordeal with func in stucts
struct Constants {
    
    // MARK: - AppName
    static let appName = "⚡️FlashChat"

    
    // MARK: - Segue Constants
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    // MARK: - Cell Identifiers
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"

    // MARK: - Colours
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    // MARK: - TOBECHANGED
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
