import Foundation


var numberOfPeople: Int     = 6
var slicesPerPerson: Int    = 5

// Observable properties
var pizzaInInches: Int      = 10 {
    willSet { // hasn't been set yet, about to be set. Old value is accessible with the name of the variable itself. DidSet acts the exact opposite.
        print(pizzaInInches)
        print(newValue)
    }
    didSet {
        print(pizzaInInches)
        print(oldValue)
    }
}

pizzaInInches = 20
 
// Computed values must be var. Datatype must be stated explicitly.
var numberOfSlices: Int {
    // This is a getter. Could be done explicitly by using the get {} syntax.
    get {
        return pizzaInInches - 4
    }
    
    // Enables the use of newValue and assigning a value directly. Without writing set on a getter/setter, then it is not possible to assign values directly. Read Only. Is called exactly when a new value is assigned.
    set {
        print("Num of Slices now has a new value which is \(newValue)")
    }
}

numberOfSlices = 12

// Next round
pizzaInInches = 14
print(numberOfSlices)


var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
        print(numberOfPeople)
    }
}

print(numberOfPizza)

numberOfPizza = 5
