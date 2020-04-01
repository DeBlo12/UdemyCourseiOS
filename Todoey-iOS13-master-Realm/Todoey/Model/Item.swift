//
//  Item.swift
//  
//
//  Created by Ivo Specht on 01/04/2020.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool    = false
    
    // Defining the reverse relatinship from Item to its Category. 
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
