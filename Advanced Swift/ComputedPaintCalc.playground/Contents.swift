import Foundation

// Getters and Setters makes it easy to cut down on Functions all around your code. 

var width: Double    = 1.5
var height: Double   = 2.3

// 1 Bucket of paint covers 1.5 sqm.

var bucketsOfPaint: Int {
    get {
        let area                            = width * height
        let areaCoveredPerBucket: Double    = 1.5
        let numberOfBuckets                 = area / areaCoveredPerBucket
        let roundedBuckets                  = ceil(numberOfBuckets)
        return Int(roundedBuckets)
    }
    
    set {
        // How much area can the amount of buckets cover
        print("With \(newValue) Buckets of paint, you can cover approx. \(Double(newValue) * 1.5) sqm, given that one bucket covers 1.5 square meters.")
    }
    
}

print(bucketsOfPaint)

bucketsOfPaint = 5
