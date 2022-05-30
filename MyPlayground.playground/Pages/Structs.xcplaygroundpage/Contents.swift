//: [Previous](@previous)

import Foundation

/**
 Structs
 
 One of the most important differences between structures and classes is that structures are always copied when they’re passed around in your code, but classes are passed by reference.
 */
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
//: [Next](@next)
