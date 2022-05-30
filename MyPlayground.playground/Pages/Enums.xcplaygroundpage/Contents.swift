//: [Previous](@previous)

import Foundation

/**
 enum
 by default, raw value starting at zero and incrementing by one each time, but you can change this behavior by explicitly specifying values.
 */

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue // 1
ace.simpleDescription() // "ace"

Rank.six.simpleDescription() // "6"


func compareRank(a: Rank, b: Rank) -> (min: Rank, max: Rank) {
    if a.rawValue > b.rawValue {
        return (min: b, max: a)
    }else {
        return (min: a, max: b)
    }
}

let result = compareRank(a: Rank.eight, b: Rank.four)
print(result) // (min: __lldb_expr_175.Rank.four, max: __lldb_expr_175.Rank.eight)


/**
 instantiation
 */
// optional, because the initializer of enum is failable  init?(rawValue:)
let rand: Rank? = Rank(rawValue: 3)


/**
 Todo: don't understand
 */

/**
 If an enumeration has raw values, those values are determined as part of the declaration, which means every instance of a particular enumeration case always has the same raw value. Another choice for enumeration cases is to have values associated with the case—these values are determined when you make the instance, and they can be different for each instance of an enumeration case. You can think of the associated values as behaving like stored properties of the enumeration case instance. For example, consider the case of requesting the sunrise and sunset times from a server. The server either responds with the requested information, or it responds with a description of what went wrong.
 */

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}
// Prints "Sunrise is at 6:00 am and sunset is at 8:09 pm."

// Notice how the sunrise and sunset times are extracted from the ServerResponse value as part of matching the value against the switch cases.

//: [Next](@next)
