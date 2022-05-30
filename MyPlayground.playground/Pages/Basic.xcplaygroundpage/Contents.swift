import UIKit

/**
 Simple Values
 */
var myVariable = 42

myVariable = 40

// constant

let myConst = 42

// myConst = 40 error!

// implicit type declaration
let myConstant = 42

let implicitInteger = 70

let implicitDouble = 70.0


// explicit type declaration
let explicitDouble: Double = 70

let explicitInteger: Int = 70

let explicitFloat: Float = 70

// no implicit convertion

let label = "The width is "
let width = 94
let widthLable = label + String(width)


// another way to include values in strings:

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"
print(appleSummary, fruitSummary)


// template string

let quotation = """
     I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

print(quotation)


// array

var shoppingList = ["caatfish", "water", "tulips"]
shoppingList[1] = "bottle of water"
shoppingList.append("blue paint")
print(shoppingList)


var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]

occupations["Jayne"] = "Public Relations"

let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]


shoppingList = []

occupations = [:]

print(shoppingList, occupations)


/**
 Control Flow
 */

let individualScores = [75, 43, 103, 87, 12]

var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    }else {
        teamScore += 1
    }
}

print(teamScore)



var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String?
var greeting = "Hello!"

// unwrap optional
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Nobody here."
}

/**
 switch
 */
// support any kind of data and a wide variety of comperison operations.

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
    // break is optional, auto exists after case is matched.
    // break --> you don't need to write this
case "cucumber", "watercress":
    print("That would make a good tea sandwich")
    // amazing!
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
    // must add the default case, to include all cases.
    // But sometimes you don't have to, if the cases above already includes all situations.
default:
    print("Everything tastes good in soup")
}

enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        // you don't have to write the default, cases above already include all situations.
        }
    }
}

/**
 for in
 */

let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25]
]

var largest = 0

for(type, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            print(type, number)
            largest = number
        }
    }
}

print(largest)

/**
 while
 */

var n = 2
while n < 100 {
    n *= 2
}

print(n)

var m = 2
// notice: you mustn't write m *=2, there must be a space between the operator and the number "2", or you'll get a compile error:
// error: consecutive statements on a line must be separated by ';'
repeat {
    m *= 2
} while m < 100

print(m)


/**
 function
 */

func greet(person: String, lunch: String) ->String {
    return "Hello \(person), we'll take \(lunch) today!"
}
// the argument label must be correct, "person" and "lunch", and the order must be correct too! argument 'person' must precede argument 'lunch'
greet(person: "Bob", lunch: "steak")


/**
 tuple
 */

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        sum += score
        if score > max {
            max = score
        }else if score < min {
            min = score
        }
    }
    
    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [5,3,100, 3, 9])
print(statistics)
// referred by name
print(statistics.max)
// referred by index
print(statistics.1)

/**
 nested function
 */

func returnFifteen() -> Int {
    var y = 10
    func add () {
        // can access variables declared in outer function
        return y += 5
    }
    add()
    return y
}

returnFifteen()

/**
 function returns another function
 */
func makeIncrementer(incrementer: Int) -> ((Int) -> Int) {
    func add(number: Int) -> Int {
        return number + incrementer
    }
    return add;
}

var increment = makeIncrementer(incrementer: 1)
increment(7)
increment = makeIncrementer(incrementer: 2)
increment(7)

/**
 function can take another function as argument
 */

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]

hasAnyMatches(list: numbers, condition: lessThanTen)

/**
 Anonymous function
 */
numbers.map({(number: Int)->Int in
    return number % 2 == 0 ? number : 0
})

numbers.map({number in 3 * number})

let sortedNumbers = numbers.sorted(by: {(a: Int, b: Int) -> Bool in
    return a > b;
})

let sortedNumbers2 = numbers.sorted(by: {(a,b) in a > b})


let sortedNumbers3 = numbers.sorted{$0 > $1}



