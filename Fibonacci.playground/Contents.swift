import UIKit
func fibonacci(n: Int) {

    var numA = 0
    var numB = 1
    
    if n == 0 {
        print("Invalid")
    } else if n == 1 {
        print(numA)
    } else if n == 2 {
        print(numA, numB)
    } else {
        var array = [numA, numB]

        for _ in 1...n {
            let numC = numA + numB
            numA = numB
            numB = numC
            array.append(numC)
        }
        print(array)
        print(array.count)
    }
}

fibonacci(n: 90)
