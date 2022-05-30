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

/**
 getter and setter
 */
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    // getter and setter
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            // newValue is the newly set value
            sideLength = newValue / 3.0
        }
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")

print(triangle.perimeter) // 9.3

triangle.perimeter = 9.9
print(triangle.sideLength) // 3.3




//: [Next](@next)

