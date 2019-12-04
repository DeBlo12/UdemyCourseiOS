import UIKit

var str = "Hello, playground"


struct Town {
    let name: String
    var citizens: [String]
    var resources: [String: Int]
    
    init(name: String, citizens: [String], resources: [String: Int]) {
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
    
    
    func fortify() {
        print("Defences increased!")
    }
    
    
}

var anotherTown = Town(name: "Ivo Town", citizens: ["Ivo Specht", "Natalie Hafner"], resources: ["Laptops": 2, "Bows": 1, "Arrows": 100, "Austrians": 1])

anotherTown
anotherTown.citizens
anotherTown.resources["Austrians"]


