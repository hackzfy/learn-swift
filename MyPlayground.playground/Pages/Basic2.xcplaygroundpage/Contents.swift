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
            // the new value has the implicit name newValue.
            sideLength = newValue / 3.0
        }
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")

print(triangle.perimeter) // 9.3

triangle.perimeter = 9.9
print(triangle.sideLength) // 3.3


/**
 willSet and didSet
 */

class WillAndDid {
    
    var name: String {
       
       // notice: you can't write willSet and didSet along with a getter.
        willSet {
            print("name is \(name) and will be set to \(newValue)")
        }
        didSet {
            print("name has been set to \(self.name)")
        }
    }
    init(name: String){
        self.name = name
        print("name initialized to \(name)")
    }
}

let willAndDid = WillAndDid(name: "test");
willAndDid.name = "done"


/**
 optional values
 
 */
// declare the optional type
let optionalSquare: Square? = Square(sideLength: 2.0)
// read the prop of the optional type, optional expressions always returns optional values.
// that is some value or nil.
let sideLength = optionalSquare?.sideLength

//: [Next](@next)

