//: [Previous](@previous)

import Foundation

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// use throws to mark the function which can throw an error.
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        // use throw statement to throw an error.
        throw PrinterError.noToner
    }
    return "Job sent"
}

// the form of using a throwable function. do...catch and a try before the function
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}
// Prints "Job sent"


// another way to use try, if the function throws an error, the result will be nil

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner") // nil

/**
 defer
 Use defer to write a block of code that’s executed after all other code in the function, just before the function returns. The code is executed regardless of whether the function throws an error. You can use defer to write setup and cleanup code next to each other, even though they need to be executed at different times.
 */

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)
// Prints "false"




//: [Next](@next)
