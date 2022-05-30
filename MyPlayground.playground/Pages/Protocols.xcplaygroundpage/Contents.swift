//: [Previous](@previous)

import Foundation

/**
 Protocols
 */

protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    // Since adjust will modify the property of the struct, it has to add the "mutating" keyword.
    // Methods on a class don't need to add the "mutating" keyword, they can always modify the class.
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription



/**
 extension
 Use extension to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that’s declared elsewhere, or even to a type that you imported from a library or framework.
 */

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "the number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

// protocol is just like interface in java, generic type is also supported.

var testInt: ExampleProtocol = 1;
testInt.simpleDescription // "the number 1"
testInt.adjust()
testInt.simpleDescription // "the number 43"

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// Prints "A very simple class.  Now 100% adjusted."
// print(protocolValue.anotherProperty)  // Uncomment to see the error

//: [Next](@next)
