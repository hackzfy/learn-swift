//: [Previous](@previous)

import Foundation

/**
 Structs
 
 One of the most important differences between structures and classes is that structures are always copied when they’re passed around in your code, but classes are passed by reference.
 */

enum Rank{
    case one, two,three
    func simpleDescription() -> String {
        return ""
    }
}

enum Suit {
    case spades
    func simpleDescription() -> String {
        return ""
    }
}
struct Card {
    var rank: Rank
    var suit: Suit
    let name = "Card"
    var age = 10
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


/**
 threeOfSpades.name = "Another card"
 threeOfSpades.age = 20
 Code above are invalid, because threeOfSpades is declared as a const. When an instance of a value type is marked as a constant, so are all its properties. 如果将一个值类型声明为常量，则它的所有属性也被认为是常量，而 struct 正是值类型。
 */


var twoOfSpades = Card(rank: .two, suit: .spades)
// twoOfSpades 被声明为变量后，可以对其声明为变量的属性进行修改
twoOfSpades.age = 20

// 尽管如此，因为twoOfSpades的 name 属性被声明为常量，仍然是不可修改的
// twoOfSpades.name = "Another card" // error



/**
 
 */
//: [Next](@next)
