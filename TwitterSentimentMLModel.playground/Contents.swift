import Cocoa
import CoreML
import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/ivospecht/Desktop/twitter-sanders-apple3.csv"))


let(trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)

let classifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let evaluation = classifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")
let evalAccuracy = (1.0 - evaluation.classificationError) * 100

let metadata = MLModelMetadata(author: "Ivo Specht", shortDescription: "Twitter Sentiment Analysis", version: "1.0")

try classifier.write(to: URL(fileURLWithPath: "/Users/ivospecht/Desktop/sentimentAnalysis.mlmodel"))

try classifier.prediction(from: "@Apple is terrible!")
try classifier.prediction(from: "@apple is great")
try classifier.prediction(from: "@apple is ok")


