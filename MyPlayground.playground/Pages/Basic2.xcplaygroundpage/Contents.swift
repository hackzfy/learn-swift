//: [Previous](@previous)

import Foundation

class Shape {
    var numbersOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numbersOfSides) sides."
    }
    deinit{
        // clean up
    }
}

var shape = Shape()
shape.numbersOfSides = 7
var shapeDescription = shape.simpleDescription()


class NamedShape {
    var numberOfSides = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape called \(name)"
    }
}


var namedShape = NamedShape(name: "cube")
namedShape.simpleDescription()

class Square: NamedShape {
    var sideLength: Double
    init(sideLength: Double) {
        self.sideLength = sideLength
        super.init(name: "Square")
        numberOfSides = 4
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

var square = Square(sideLength: 10.3)







//: [Next](@next)

